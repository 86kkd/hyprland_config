-- Load AFTER your default/user keybind modules, with the updated plugin loaded.
-- Normal native workspaces remain available when another layout is selected.
local function scroller()
  return hl.get_config("general.layout") == "scroller"
end

local function bind(key, action, description)
  hl.unbind(key)
  hl.bind(key, action, { description = description })
end

local function switch(key, canvas, native)
  bind(key, function()
    if scroller() then
      hl.plugin.scroller.switch_workspace(canvas)
    else
      hl.dispatch(hl.dsp.focus({ workspace = native }))
    end
  end, "switch whole canvas workspace")
end

local function move(key, direction, native, follow)
  bind(key, function()
    if scroller() then
      -- Reorder locally or hand off to another physical monitor's visible
      -- workspace. Never dispatch movetoworkspace +/-1 from this path.
      hl.plugin.scroller.move_window(direction)
    else
      hl.dispatch(hl.dsp.window.move({ workspace = native, follow = follow }))
    end
  end, "move window within visible canvas")
end

switch("SUPER + tab", "r", "m+1")
switch("SUPER + SHIFT + tab", "l", "m-1")
switch("SUPER + mouse_down", "r", "e+1")
switch("SUPER + mouse_up", "l", "e-1")
move("CTRL + SHIFT + H", "l", "-1", true)
move("CTRL + SHIFT + L", "r", "+1", true)
for _, spec in ipairs({ {"bracketleft", "l", "-1"}, {"bracketright", "r", "+1"} }) do
  move("SUPER + SHIFT + " .. spec[1], spec[2], spec[3], true)
  move("SUPER + CTRL + " .. spec[1], spec[2], spec[3], false)
end

for number = 1, 10 do
  local native = tostring(number)
  local code = "code:" .. tostring(number + 9)
  switch("SUPER + " .. code, native, native)
  for _, mods in ipairs({ "SHIFT", "CTRL" }) do
    local follow = mods == "SHIFT"
    bind("SUPER + " .. mods .. " + " .. code, function()
      -- A numbered destination means another global canvas, not a monitor.
      -- This shortcut is intentionally inactive in scroller's monitor-only
      -- window movement model. Use directional window movement instead.
      if not scroller() then
        hl.dispatch(hl.dsp.window.move({ workspace = native, follow = follow }))
      end
    end, "move to native workspace (other layouts only)")
  end
end

-- Preserve monitor ownership: moving an entire native workspace to a different
-- monitor bypasses the canvas mapping. Keep these bindings for other layouts.
for _, spec in ipairs({ {"F9", "left"}, {"F10", "right"}, {"F11", "up"}, {"F12", "down"} }) do
  bind("SUPER + CTRL + " .. spec[1], function()
    if not scroller() then
      hl.dispatch(hl.dsp.workspace.move({ monitor = spec[2] }))
    end
  end, "move native workspace (other layouts only)")
end

-- User configs may have added these without removing the default comma/period
-- workspace binds. Unbind all duplicates before installing the plugin actions.
for _, spec in ipairs({ {"n", "l"}, {"m", "d"}, {"comma", "u"}, {"period", "r"} }) do
  bind("SUPER + " .. spec[1], function()
    if scroller() then
      hl.plugin.scroller.focus_monitor(spec[2])
    elseif spec[1] == "comma" or spec[1] == "period" then
      hl.dispatch(hl.dsp.focus({ workspace = spec[1] == "comma" and "e-1" or "e+1" }))
    end
  end, "focus monitor / preview global canvas (scroller)")
end
