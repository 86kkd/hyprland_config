-- Generated from legacy Hyprland .conf files.
-- Module: settings
-- Sources:
--   configs/SystemSettings.conf

local H = HyprLua
local vars = H.vars
local expand = H.expand
local load_hypr_vars = H.load_hypr_vars


-- Source: configs/SystemSettings.conf
vars["scriptsDir"] = H.expand("$HOME/.config/hypr/scripts")
hl.config({ dwindle = { preserve_split = true } })
hl.config({ dwindle = { special_scale_factor = 0.8 } })
hl.config({ master = { new_status = "master" } })
hl.config({ master = { new_on_top = 1 } })
hl.config({ master = { mfact = 0.5 } })
hl.config({ general = { resize_on_border = true } })
hl.config({ general = { layout = "dwindle" } })
hl.config({ input = { kb_layout = "us" } })
hl.config({ input = { kb_variant = "" } })
hl.config({ input = { kb_model = "" } })
hl.config({ input = { kb_options = "" } })
hl.config({ input = { kb_rules = "" } })
hl.config({ input = { repeat_rate = 50 } })
hl.config({ input = { repeat_delay = 300 } })
hl.config({ input = { sensitivity = 0 } })
hl.config({ input = { numlock_by_default = true } })
hl.config({ input = { left_handed = false } })
hl.config({ input = { follow_mouse = 1 } })
hl.config({ input = { float_switch_override_focus = false } })
hl.config({ input = { touchpad = { disable_while_typing = true } } })
hl.config({ input = { touchpad = { natural_scroll = true } } })
hl.config({ input = { touchpad = { clickfinger_behavior = false } } })
hl.config({ input = { touchpad = { middle_button_emulation = false } } })
hl.config({ input = { touchpad = { tap_to_click = true } } })
hl.config({ input = { touchpad = { drag_lock = false } } })
hl.config({ input = { touchdevice = { enabled = true } } })
hl.config({ input = { tablet = { transform = 0 } } })
hl.config({ input = { tablet = { left_handed = 0 } } })
hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})
hl.config({ gestures = { workspace_swipe_distance = 500 } })
hl.config({ gestures = { workspace_swipe_invert = true } })
hl.config({ gestures = { workspace_swipe_min_speed_to_force = 30 } })
hl.config({ gestures = { workspace_swipe_cancel_ratio = 0.5 } })
hl.config({ gestures = { workspace_swipe_create_new = true } })
hl.config({ gestures = { workspace_swipe_forever = true } })
hl.gesture({
  fingers = 4,
  direction = "up",
  action = function()
    hl.exec_cmd(expand("hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 1.5}')\""))
  end,
})
hl.gesture({
  fingers = 4,
  direction = "down",
  action = function()
    hl.exec_cmd(expand("hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 1.5}')\""))
  end,
})
hl.gesture({
  fingers = 3,
  direction = "up",
  action = function()
    hl.exec_cmd(expand("$scriptsDir/OverviewToggle.sh"))
  end,
})
hl.config({ misc = { disable_hyprland_logo = true } })
hl.config({ misc = { disable_splash_rendering = true } })
hl.config({ misc = { vrr = 2 } })
hl.config({ misc = { mouse_move_enables_dpms = true } })
hl.config({ misc = { enable_swallow = false } })
hl.config({ misc = { swallow_regex = expand("^(kitty)$") } })
hl.config({ misc = { focus_on_activate = false } })
hl.config({ misc = { initial_workspace_tracking = 0 } })
hl.config({ misc = { middle_click_paste = false } })
hl.config({ misc = { enable_anr_dialog = true } })
hl.config({ misc = { anr_missed_pings = 15 } })
hl.config({ misc = { allow_session_lock_restore = true } })
hl.config({ misc = { on_focus_under_fullscreen = 1 } })
hl.config({ binds = { workspace_back_and_forth = true } })
hl.config({ binds = { allow_workspace_cycles = true } })
hl.config({ binds = { pass_mouse_when_bound = false } })
hl.config({ xwayland = { enabled = true } })
hl.config({ xwayland = { force_zero_scaling = true } })
hl.config({ render = { direct_scanout = 0 } })
hl.config({ cursor = { sync_gsettings_theme = true } })
hl.config({ cursor = { no_hardware_cursors = 2 } })
hl.config({ cursor = { hide_on_key_press = true } })
hl.config({ cursor = { enable_hyprcursor = true } })
hl.config({ cursor = { warp_on_change_workspace = 2 } })
hl.config({ cursor = { no_warps = true } })
