local H = HyprLua
local vars = H.vars
local expand = H.expand

vars.mainMod = "SUPER"
vars.scriptsDir = expand("$HOME/.config/hypr/scripts")
vars.UserScripts = expand("$HOME/.config/hypr/UserScripts")
vars.UserConfigs = expand("$HOME/.config/hypr/UserConfigs")
hl.unbind("SUPER + SPACE")
hl.unbind("SUPER + H")
hl.unbind("SUPER + ALT + L")
hl.unbind("SUPER + CTRL + H")
hl.unbind("SUPER + CTRL + K")
hl.unbind("SUPER + CTRL + L")
hl.unbind("SUPER + I")

local function scroller_active()
  return hl.get_config("general.layout") == "scroller"
end

local function focus_direction(direction)
  return function()
    if scroller_active() then
      hl.plugin.scroller.move_focus(direction)
    else
      hl.dispatch(H.dispatch("movefocus", direction))
    end
  end
end

local function move_direction(direction)
  return function()
    if scroller_active() then
      hl.plugin.scroller.move_window(direction)
    else
      hl.dispatch(H.dispatch("movewindow", direction))
    end
  end
end

local function scroller_action(action, argument)
  return function()
    if scroller_active() then
      hl.plugin.scroller[action](argument)
    end
  end
end
hl.bind("SUPER + F9", hl.dsp.exec_cmd(expand("$scriptsDir/ScreenRecord.sh -s")), {
  description = "start screen recording (system audio)",
})
hl.bind("SUPER + F8", hl.dsp.exec_cmd(expand("pkill -INT -x wf-recorder")), {
  description = "stop screen recording",
})
hl.bind("CTRL + SHIFT + F", H.dispatch("togglefloating", ""), {
  description = "Float current window",
})
hl.bind("CTRL + Q", H.dispatch("killactive", ""), {
  description = "close active window",
})
hl.bind("CTRL + SHIFT + H", H.dispatch("movetoworkspace", "-1"), {
  description = "move to previous workspace",
})
hl.bind("CTRL + SHIFT + L", H.dispatch("movetoworkspace", "+1"), {
  description = "move to next workspace",
})
hl.bind("SUPER + ALT + h", H.dispatch("swapwindow", "l"), {
  description = "swap window left",
})
hl.bind("SUPER + ALT + j", H.dispatch("swapwindow", "d"), {
  description = "swap window down",
})
hl.bind("SUPER + ALT + k", H.dispatch("swapwindow", "u"), {
  description = "swap window up",
})
hl.bind("SUPER + ALT + l", H.dispatch("swapwindow", "r"), {
  description = "swap window right",
})
hl.bind("SUPER + h", focus_direction("l"), {
  description = "focus left",
})
hl.bind("SUPER + j", focus_direction("d"), {
  description = "focus down",
})
hl.bind("SUPER + k", focus_direction("u"), {
  description = "focus up",
})
hl.bind("SUPER + l", focus_direction("r"), {
  description = "focus right",
})
hl.bind("SUPER + CTRL + h", move_direction("l"), {
  description = "move window left",
})
hl.bind("SUPER + CTRL + j", move_direction("d"), {
  description = "move window down",
})
hl.bind("SUPER + CTRL + k", move_direction("u"), {
  description = "move window up",
})
hl.bind("SUPER + CTRL + l", move_direction("r"), {
  description = "move window right",
})
hl.bind("SUPER + n", scroller_action("focus_monitor", "l"), {
  description = "focus monitor left (scroller)",
})
hl.bind("SUPER + m", scroller_action("focus_monitor", "d"), {
  description = "focus monitor down (scroller)",
})
hl.bind("SUPER + comma", scroller_action("focus_monitor", "u"), {
  description = "focus monitor up (scroller)",
})
hl.bind("SUPER + period", scroller_action("focus_monitor", "r"), {
  description = "focus monitor right (scroller)",
})
hl.bind("SUPER + F", function()
  if scroller_active() then
    hl.plugin.scroller.toggle_fullscreen()
  else
    hl.dispatch(H.dispatch("fullscreenstate", "2 0"))
  end
end, {
  description = "toggle fullscreen for current layout",
})
hl.bind("SUPER + I", function()
  if scroller_active() then
    hl.plugin.scroller.toggle_overview()
  else
    hl.dispatch(H.dispatch("layoutmsg", "addmaster"))
  end
end, {
  description = "overview or add master for current layout",
})
hl.bind("SUPER + Y", hl.dsp.exec_cmd(expand("$scriptsDir/ChangeLayout.sh")), {
  description = "cycle master/dwindle/scrolling layout",
})
hl.bind("SUPER + space", hl.dsp.exec_cmd(expand("pkill rofi || rofi -show drun -modi drun,filebrowser,run,window")), {
  description = "app launcher",
})
hl.bind("SUPER + O", hl.dsp.exec_cmd(expand("$term")), {
  description = "open terminal",
})
