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

HyprLua = {
  vars = vars,
  expand = expand,
  load_hypr_vars = load_hypr_vars,
}
