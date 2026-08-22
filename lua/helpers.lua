-- Shared helpers for split Hyprland Lua modules.

local home = os.getenv("HOME") or "/home/linda"
local vars = { HOME = home }

local function expand(value)
  value = tostring(value or "")
  value = value:gsub("%${([%w_]+):%-([^}]*)}", function(name, fallback)
    return os.getenv(name) or fallback
  end)
  value = value:gsub("%$([%w_]+)", function(name)
    return vars[name] or os.getenv(name) or ""
  end)
  return value
end

local function strip_comment(line)
  local single, double, escaped = false, false, false
  local result = {}
  for i = 1, #line do
    local ch = line:sub(i, i)
    if escaped then
      result[#result + 1], escaped = ch, false
    elseif ch == "\\" then
      result[#result + 1], escaped = ch, true
    elseif ch == "'" and not double then
      single = not single
      result[#result + 1] = ch
    elseif ch == '"' and not single then
      double = not double
      result[#result + 1] = ch
    elseif ch == "#" and not single and not double then
      break
    else
      result[#result + 1] = ch
    end
  end
  return table.concat(result):match("^%s*(.-)%s*$")
end

local function unquote(value)
  if #value >= 2 then
    local first, last = value:sub(1, 1), value:sub(-1)
    if first == last and (first == '"' or first == "'") then
      return value:sub(2, -2)
    end
  end
  return value
end

local function load_hypr_vars(path)
  local file = io.open(path, "r")
  if not file then return end
  for raw in file:lines() do
    local line = strip_comment(raw)
    local name, value = line:match("^%s*%$([%w_]+)%s*=%s*(.-)%s*$")
    if name then vars[name] = expand(unquote(value)) end
  end
  file:close()
end

local directions = {
  l = "left",
  r = "right",
  u = "up",
  d = "down",
}

-- Translate legacy dispatcher names into Hyprland's native Lua API.
local function dispatch(name, arg)
  arg = arg or ""

  if name == "movefocus" then
    return hl.dsp.focus({ direction = directions[arg] or arg })
  elseif name == "movewindow" then
    return hl.dsp.window.move({ direction = directions[arg] or arg })
  elseif name == "swapwindow" then
    return hl.dsp.window.swap({ direction = directions[arg] or arg })
  elseif name == "workspace" then
    return hl.dsp.focus({ workspace = arg })
  elseif name == "movetoworkspace" then
    return hl.dsp.window.move({ workspace = arg, follow = true })
  elseif name == "movetoworkspacesilent" then
    return hl.dsp.window.move({ workspace = arg, follow = false })
  elseif name == "movecurrentworkspacetomonitor" then
    return hl.dsp.workspace.move({ monitor = directions[arg] or arg })
  elseif name == "togglefloating" then
    return hl.dsp.window.float({ action = "toggle" })
  elseif name == "fullscreen" then
    local mode = arg == "1" and "maximized" or "fullscreen"
    return hl.dsp.window.fullscreen({ mode = mode, action = "toggle" })
  elseif name == "fullscreenstate" then
    local internal, client = arg:match("^(%S+)%s+(%S+)$")
    return hl.dsp.window.fullscreen_state({
      internal = tonumber(internal),
      client = tonumber(client),
      action = "toggle",
    })
  elseif name == "killactive" then
    return hl.dsp.window.close()
  elseif name == "pseudo" then
    return hl.dsp.window.pseudo()
  elseif name == "togglegroup" then
    return hl.dsp.group.toggle()
  elseif name == "changegroupactive" then
    return arg == "b" and hl.dsp.group.prev() or hl.dsp.group.next()
  elseif name == "layoutmsg" then
    return hl.dsp.layout(arg)
  elseif name == "togglespecialworkspace" then
    return hl.dsp.workspace.toggle_special(arg)
  elseif name == "cyclenext" then
    return hl.dsp.window.cycle_next()
  elseif name == "bringactivetotop" then
    return hl.dsp.window.bring_to_top()
  elseif name == "moveintogroup" then
    return hl.dsp.window.move({ into_group = directions[arg] or arg })
  elseif name == "moveoutofgroup" then
    return hl.dsp.window.move({ out_of_group = true })
  elseif name == "resizeactive" then
    local x, y = arg:match("^([%-0-9]+)%s+([%-0-9]+)$")
    return hl.dsp.window.resize({ x = tonumber(x), y = tonumber(y), relative = true })
  elseif name == "setprop" then
    local _, prop, value = arg:match("^(%S+)%s+(%S+)%s+(.+)$")
    return hl.dsp.window.set_prop({ prop = prop, value = value })
  elseif name == "exit" then
    return hl.dsp.exit()
  end

  error("unsupported legacy dispatcher: " .. name .. " " .. arg)
end

HyprLua = {
  vars = vars,
  expand = expand,
  load_hypr_vars = load_hypr_vars,
  dispatch = dispatch,
}
