local H = HyprLua
local vars = H.vars
local expand = H.expand

vars.mainMod = "SUPER"
vars.scriptsDir = expand("$HOME/.config/hypr/scripts")
vars.UserConfigs = expand("$HOME/.config/hypr/UserConfigs")
vars.UserScripts = expand("$HOME/.config/hypr/UserScripts")
hl.bind("SUPER + D", hl.dsp.exec_cmd(expand("pkill rofi || true && rofi -show drun -modi drun,filebrowser,run,window")),
  {
    description = "app launcher",
  })
hl.bind("SUPER + B", hl.dsp.exec_cmd(expand("xdg-open \"https://\"")), {
  description = "open default browser",
})
hl.bind("SUPER + A", hl.dsp.exec_cmd(expand("$scriptsDir/OverviewToggle.sh")), {
  description = "desktop overview",
})
hl.bind("SUPER + Return", hl.dsp.exec_cmd(expand("$term")), {
  description = "Open terminal",
})
hl.bind("SUPER + E", hl.dsp.exec_cmd(expand("$files")), {
  description = "file manager",
})
hl.bind("SUPER + T", hl.dsp.exec_cmd(expand("$scriptsDir/ThemeChanger.sh")), {
  description = "Global theme switcher using Wallust",
})
hl.bind("SUPER + H", hl.dsp.exec_cmd(expand("$scriptsDir/KeyHints.sh")), {
  description = "help / cheat sheet",
})
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd(expand("$scriptsDir/Refresh.sh")), {
  description = "refresh bar and menus",
})
hl.bind("SUPER + ALT + E", hl.dsp.exec_cmd(expand("$scriptsDir/RofiEmoji.sh")), {
  description = "emoji menu",
})
hl.bind("SUPER + S", hl.dsp.exec_cmd(expand("$scriptsDir/RofiSearch.sh")), {
  description = "web search",
})
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd(expand("rofi -show window")), {
  description = "window switcher",
})
hl.bind("SUPER + ALT + O", hl.dsp.exec_cmd(expand("$scriptsDir/ChangeBlur.sh")), {
  description = "toggle blur",
})
hl.bind("SUPER + SHIFT + G", hl.dsp.exec_cmd(expand("$scriptsDir/GameMode.sh")), {
  description = "toggle game mode",
})
hl.bind("SUPER + ALT + L", hl.dsp.exec_cmd(expand("$scriptsDir/ChangeLayout.sh")), {
  description = "cycle master/dwindle/scrolling layout",
})
hl.bind("SUPER + ALT + V", hl.dsp.exec_cmd(expand("$scriptsDir/ClipManager.sh")), {
  description = "clipboard manager",
})
hl.bind("SUPER + CTRL + R", hl.dsp.exec_cmd(expand("$scriptsDir/RofiThemeSelector.sh")), {
  description = "rofi theme selector",
})
hl.bind("SUPER + CTRL + SHIFT + R",
  hl.dsp.exec_cmd(expand("pkill rofi || true && $scriptsDir/RofiThemeSelector-modified.sh")), {
    description = "rofi theme selector (modified)",
  })
hl.bind("SUPER + SHIFT + F", H.dispatch("fullscreen", ""), {
  description = "fullscreen",
})
hl.bind("SUPER + CTRL + F", H.dispatch("fullscreen", "1"), {
  description = "maximize window",
})
hl.bind("SUPER + SPACE", H.dispatch("togglefloating", ""), {
  description = "Float current window",
})
hl.bind("SUPER + ALT + SPACE", hl.dsp.exec_cmd(expand("hyprctl dispatch workspaceopt allfloat")), {
  description = "Float all windows",
})
hl.bind("SUPER + SHIFT + Return", hl.dsp.exec_cmd(expand("$scriptsDir/Dropterminal.sh $term")), {
  description = "DropDown terminal",
})
hl.bind("SUPER + ALT + mouse_down",
  hl.dsp.exec_cmd(expand(
    "hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 2.0}')\"")),
  {
    description = "zoom in",
  })
hl.bind("SUPER + ALT + mouse_up",
  hl.dsp.exec_cmd(expand(
    "hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 2.0}')\"")),
  {
    description = "zoom out",
  })
hl.bind("SUPER + CTRL + ALT + B", hl.dsp.exec_cmd(expand("pkill -SIGUSR1 waybar")), {
  description = "toggle waybar on/off",
})
hl.bind("SUPER + CTRL + B", hl.dsp.exec_cmd(expand("$scriptsDir/WaybarStyles.sh")), {
  description = "waybar styles menu",
})
hl.bind("SUPER + ALT + B", hl.dsp.exec_cmd(expand("$scriptsDir/WaybarLayout.sh")), {
  description = "waybar layout menu",
})
hl.bind("SUPER + N", hl.dsp.exec_cmd(expand("$scriptsDir/Hyprsunset.sh toggle")), {
  description = "toggle night light",
})
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd(expand("$UserScripts/RofiBeats.sh")), {
  description = "online music",
})
hl.bind("SUPER + W", hl.dsp.exec_cmd(expand("$UserScripts/WallpaperSelect.sh")), {
  description = "select wallpaper",
})
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd(expand("$UserScripts/WallpaperEffects.sh")), {
  description = "wallpaper effects",
})
hl.bind("CTRL + ALT + W", hl.dsp.exec_cmd(expand("$UserScripts/WallpaperRandom.sh")), {
  description = "random wallpaper",
})
hl.bind("SUPER + CTRL + O", H.dispatch("setprop", "active opaque toggle"), {
  description = "toggle active window opacity",
})
hl.bind("SUPER + SHIFT + K", hl.dsp.exec_cmd(expand("$scriptsDir/KeyBinds.sh")), {
  description = "search keybinds",
})
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd(expand("$scriptsDir/Animations.sh")), {
  description = "animations menu",
})
hl.bind("SUPER + SHIFT + O", hl.dsp.exec_cmd(expand("$UserScripts/ZshChangeTheme.sh")), {
  description = "change oh-my-zsh theme",
})
hl.bind("ALT_L + SHIFT_L", hl.dsp.exec_cmd(expand("$scriptsDir/KeyboardLayout.sh switch")), {
  locked = true,
  non_consuming = true,
  description = "switch keyboard layout globally",
})
hl.bind("SHIFT_L + ALT_L", hl.dsp.exec_cmd(expand("$scriptsDir/Tak0-Per-Window-Switch.sh")), {
  locked = true,
  non_consuming = true,
  description = "switch keyboard layout per-window",
})
hl.bind("SUPER + ALT + C", hl.dsp.exec_cmd(expand("$UserScripts/RofiCalc.sh")), {
  description = "calculator",
})
hl.bind("SUPER + CTRL + F9", H.dispatch("movecurrentworkspacetomonitor", "l"), {
  description = "move workspace to left monitor",
})
hl.bind("SUPER + CTRL + F10", H.dispatch("movecurrentworkspacetomonitor", "r"), {
  description = "move workspace to right monitor",
})
hl.bind("SUPER + CTRL + F11", H.dispatch("movecurrentworkspacetomonitor", "u"), {
  description = "move workspace to up monitor",
})
hl.bind("SUPER + CTRL + F12", H.dispatch("movecurrentworkspacetomonitor", "d"), {
  description = "move workspace to down monitor",
})
hl.bind("CTRL + ALT + Delete", H.dispatch("exit"), {
  description = "exit Hyprland",
})
hl.bind("SUPER + Q", H.dispatch("killactive", ""), {
  description = "close active window",
})
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd(expand("$scriptsDir/KillActiveProcess.sh")), {
  description = "Terminate active process",
})
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd(expand("$scriptsDir/LockScreen.sh")), {
  description = "lock screen",
})
hl.bind("CTRL + ALT + P", hl.dsp.exec_cmd(expand("$scriptsDir/Wlogout.sh")), {
  description = "powermenu",
})
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd(expand("swaync-client -t -sw")), {
  description = "notification panel",
})
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd(expand("$scriptsDir/Kool_Quick_Settings.sh")), {
  description = "Quick settings menu",
})
hl.bind("SUPER + CTRL + D", H.dispatch("layoutmsg", "removemaster"), {
  description = "remove master",
})
hl.bind("SUPER + I", H.dispatch("layoutmsg", "addmaster"), {
  description = "add master",
})
hl.bind("SUPER + CTRL + Return", H.dispatch("layoutmsg", "swapwithmaster"), {
  description = "swap with master",
})
hl.bind("SUPER + SHIFT + I", H.dispatch("layoutmsg", "togglesplit"), {
  description = "toggle split (dwindle)",
})
hl.bind("SUPER + P", H.dispatch("pseudo", ""), {
  description = "toggle pseudo (dwindle)",
})
hl.bind("SUPER + M", H.dispatch("layoutmsg", "splitratio 0.3 exact"), {
  description = "set split ratio 0.3",
})
hl.bind("ALT + tab", H.dispatch("cyclenext", ""), {
  description = "cycle next window",
})
hl.bind("ALT + tab", H.dispatch("bringactivetotop", ""), {
  description = "bring active to top",
})
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(expand("$scriptsDir/Volume.sh --inc")), {
  repeating = true,
  locked = true,
  description = "volume up",
})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(expand("$scriptsDir/Volume.sh --dec")), {
  repeating = true,
  locked = true,
  description = "volume down",
})
hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd(expand("$scriptsDir/Volume.sh --inc-precise")), {
  repeating = true,
  locked = true,
  description = "volume up precise",
})
hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd(expand("$scriptsDir/Volume.sh --dec-precise")), {
  repeating = true,
  locked = true,
  description = "volume down precise",
})
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(expand("$scriptsDir/Volume.sh --toggle-mic")), {
  locked = true,
  description = "toggle mic mute",
})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(expand("$scriptsDir/Volume.sh --toggle")), {
  locked = true,
  description = "toggle mute",
})
hl.bind("XF86Sleep", hl.dsp.exec_cmd(expand("systemctl suspend")), {
  locked = true,
  description = "sleep",
})
hl.bind("XF86RFKill", hl.dsp.exec_cmd(expand("$scriptsDir/AirplaneMode.sh")), {
  locked = true,
  description = "airplane mode",
})
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(expand("$scriptsDir/MediaCtrl.sh --pause")), {
  locked = true,
  description = "play/pause",
})
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(expand("$scriptsDir/MediaCtrl.sh --pause")), {
  locked = true,
  description = "pause",
})
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(expand("$scriptsDir/MediaCtrl.sh --pause")), {
  locked = true,
  description = "play",
})
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(expand("$scriptsDir/MediaCtrl.sh --nxt")), {
  locked = true,
  description = "next track",
})
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(expand("$scriptsDir/MediaCtrl.sh --prv")), {
  locked = true,
  description = "previous track",
})
hl.bind("XF86AudioStop", hl.dsp.exec_cmd(expand("$scriptsDir/MediaCtrl.sh --stop")), {
  locked = true,
  description = "stop",
})
hl.bind("SUPER + Print", hl.dsp.exec_cmd(expand("$scriptsDir/ScreenShot.sh --now")), {
  description = "screenshot now",
})
hl.bind("SUPER + SHIFT + Print", hl.dsp.exec_cmd(expand("$scriptsDir/ScreenShot.sh --area")), {
  description = "screenshot (area)",
})
hl.bind("SUPER + CTRL + Print", hl.dsp.exec_cmd(expand("$scriptsDir/ScreenShot.sh --in5")), {
  description = "screenshot in 5s",
})
hl.bind("SUPER + CTRL + SHIFT + Print", hl.dsp.exec_cmd(expand("$scriptsDir/ScreenShot.sh --in10")), {
  description = "screenshot in 10s",
})
hl.bind("ALT + Print", hl.dsp.exec_cmd(expand("$scriptsDir/ScreenShot.sh --active")), {
  description = "screenshot active window",
})
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(expand("$scriptsDir/ScreenShot.sh --swappy")), {
  description = "screenshot (swappy)",
})
hl.bind("SUPER + SHIFT + left", H.dispatch("resizeactive", "-50 0"), {
  repeating = true,
  description = "resize left (-50)",
})
hl.bind("SUPER + SHIFT + right", H.dispatch("resizeactive", "50 0"), {
  repeating = true,
  description = "resize right (+50)",
})
hl.bind("SUPER + SHIFT + up", H.dispatch("resizeactive", "0 -50"), {
  repeating = true,
  description = "resize up (-50)",
})
hl.bind("SUPER + SHIFT + down", H.dispatch("resizeactive", "0 50"), {
  repeating = true,
  description = "resize down (+50)",
})
hl.bind("SUPER + CTRL + left", H.dispatch("movewindow", "l"), {
  description = "move window left",
})
hl.bind("SUPER + CTRL + right", H.dispatch("movewindow", "r"), {
  description = "move window right",
})
hl.bind("SUPER + CTRL + up", H.dispatch("movewindow", "u"), {
  description = "move window up",
})
hl.bind("SUPER + CTRL + down", H.dispatch("movewindow", "d"), {
  description = "move window down",
})
hl.bind("SUPER + ALT + left", H.dispatch("swapwindow", "l"), {
  description = "swap window left",
})
hl.bind("SUPER + ALT + right", H.dispatch("swapwindow", "r"), {
  description = "swap window right",
})
hl.bind("SUPER + ALT + up", H.dispatch("swapwindow", "u"), {
  description = "swap window up",
})
hl.bind("SUPER + ALT + down", H.dispatch("swapwindow", "d"), {
  description = "swap window down",
})
hl.bind("SUPER + G", H.dispatch("togglegroup", ""), {
  description = "toggle group",
})
hl.bind("SUPER + Tab", H.dispatch("changegroupactive", "f"), {
  description = "Change Group Forward",
})
hl.bind("SUPER + CTRL + tab", H.dispatch("changegroupactive", ""), {
  description = "change active in group",
})
hl.bind("SUPER + SHIFT + Tab", H.dispatch("changegroupactive", "b"), {
  description = "Change Group Back",
})
hl.bind("SUPER + CTRL + K", H.dispatch("moveintogroup", "l"), {
  description = "Move left into group",
})
hl.bind("SUPER + CTRL + L", H.dispatch("moveintogroup", "r"), {
  description = "Move Right into group",
})
hl.bind("SUPER + CTRL + H", H.dispatch("moveoutofgroup", ""), {
  description = "Move active out of group",
})
hl.bind("SUPER + left", H.dispatch("movefocus", "l"), {
  description = "focus left",
})
hl.bind("SUPER + right", H.dispatch("movefocus", "r"), {
  description = "focus right",
})
hl.bind("SUPER + up", H.dispatch("movefocus", "u"), {
  description = "focus up",
})
hl.bind("SUPER + down", H.dispatch("movefocus", "d"), {
  description = "focus down",
})
hl.bind("SUPER + tab", H.dispatch("workspace", "m+1"), {
  description = "next workspace",
})
hl.bind("SUPER + SHIFT + tab", H.dispatch("workspace", "m-1"), {
  description = "previous workspace",
})
hl.bind("SUPER + SHIFT + U", H.dispatch("movetoworkspace", "special"), {
  description = "move to special workspace",
})
hl.bind("SUPER + U", H.dispatch("togglespecialworkspace", ""), {
  description = "toggle special workspace",
})
hl.bind("SUPER + code:10", H.dispatch("workspace", "1"), {
  description = "workspace 1",
})
hl.bind("SUPER + code:11", H.dispatch("workspace", "2"), {
  description = "workspace 2",
})
hl.bind("SUPER + code:12", H.dispatch("workspace", "3"), {
  description = "workspace 3",
})
hl.bind("SUPER + code:13", H.dispatch("workspace", "4"), {
  description = "workspace 4",
})
hl.bind("SUPER + code:14", H.dispatch("workspace", "5"), {
  description = "workspace 5",
})
hl.bind("SUPER + code:15", H.dispatch("workspace", "6"), {
  description = "workspace 6",
})
hl.bind("SUPER + code:16", H.dispatch("workspace", "7"), {
  description = "workspace 7",
})
hl.bind("SUPER + code:17", H.dispatch("workspace", "8"), {
  description = "workspace 8",
})
hl.bind("SUPER + code:18", H.dispatch("workspace", "9"), {
  description = "workspace 9",
})
hl.bind("SUPER + code:19", H.dispatch("workspace", "10"), {
  description = "workspace 10",
})
hl.bind("SUPER + SHIFT + code:10", H.dispatch("movetoworkspace", "1"), {
  description = "move to workspace 1",
})
hl.bind("SUPER + SHIFT + code:11", H.dispatch("movetoworkspace", "2"), {
  description = "move to workspace 2",
})
hl.bind("SUPER + SHIFT + code:12", H.dispatch("movetoworkspace", "3"), {
  description = "move to workspace 3",
})
hl.bind("SUPER + SHIFT + code:13", H.dispatch("movetoworkspace", "4"), {
  description = "move to workspace 4",
})
hl.bind("SUPER + SHIFT + code:14", H.dispatch("movetoworkspace", "5"), {
  description = "move to workspace 5",
})
hl.bind("SUPER + SHIFT + code:15", H.dispatch("movetoworkspace", "6"), {
  description = "move to workspace 6",
})
hl.bind("SUPER + SHIFT + code:16", H.dispatch("movetoworkspace", "7"), {
  description = "move to workspace 7",
})
hl.bind("SUPER + SHIFT + code:17", H.dispatch("movetoworkspace", "8"), {
  description = "move to workspace 8",
})
hl.bind("SUPER + SHIFT + code:18", H.dispatch("movetoworkspace", "9"), {
  description = "move to workspace 9",
})
hl.bind("SUPER + SHIFT + code:19", H.dispatch("movetoworkspace", "10"), {
  description = "move to workspace 10",
})
hl.bind("SUPER + SHIFT + bracketleft", H.dispatch("movetoworkspace", "-1"), {
  description = "move to previous workspace",
})
hl.bind("SUPER + SHIFT + bracketright", H.dispatch("movetoworkspace", "+1"), {
  description = "move to next workspace",
})
hl.bind("SUPER + CTRL + code:10", H.dispatch("movetoworkspacesilent", "1"), {
  description = "move silently to workspace 1",
})
hl.bind("SUPER + CTRL + code:11", H.dispatch("movetoworkspacesilent", "2"), {
  description = "move silently to workspace 2",
})
hl.bind("SUPER + CTRL + code:12", H.dispatch("movetoworkspacesilent", "3"), {
  description = "move silently to workspace 3",
})
hl.bind("SUPER + CTRL + code:13", H.dispatch("movetoworkspacesilent", "4"), {
  description = "move silently to workspace 4",
})
hl.bind("SUPER + CTRL + code:14", H.dispatch("movetoworkspacesilent", "5"), {
  description = "move silently to workspace 5",
})
hl.bind("SUPER + CTRL + code:15", H.dispatch("movetoworkspacesilent", "6"), {
  description = "move silently to workspace 6",
})
hl.bind("SUPER + CTRL + code:16", H.dispatch("movetoworkspacesilent", "7"), {
  description = "move silently to workspace 7",
})
hl.bind("SUPER + CTRL + code:17", H.dispatch("movetoworkspacesilent", "8"), {
  description = "move silently to workspace 8",
})
hl.bind("SUPER + CTRL + code:18", H.dispatch("movetoworkspacesilent", "9"), {
  description = "move silently to workspace 9",
})
hl.bind("SUPER + CTRL + code:19", H.dispatch("movetoworkspacesilent", "10"), {
  description = "move silently to workspace 10",
})
hl.bind("SUPER + CTRL + bracketleft", H.dispatch("movetoworkspacesilent", "-1"), {
  description = "move silently to previous workspace",
})
hl.bind("SUPER + CTRL + bracketright", H.dispatch("movetoworkspacesilent", "+1"), {
  description = "move silently to next workspace",
})
hl.bind("SUPER + mouse_down", H.dispatch("workspace", "e+1"), {
  description = "next workspace",
})
hl.bind("SUPER + mouse_up", H.dispatch("workspace", "e-1"), {
  description = "previous workspace",
})
hl.bind("SUPER + period", H.dispatch("workspace", "e+1"), {
  description = "next workspace",
})
hl.bind("SUPER + comma", H.dispatch("workspace", "e-1"), {
  description = "previous workspace",
})
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), {
  mouse = true,
  drag = true,
  description = "move window",
})
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), {
  mouse = true,
  drag = true,
  description = "resize window",
})
