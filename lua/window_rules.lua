local expand = HyprLua.expand

hl.window_rule({
  match = {
    class = expand("^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr|[Ff]irefox-bin)$"),
  },
  tag = "+browser",
})
hl.window_rule({
  match = {
    class = expand("^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$"),
  },
  tag = "+browser",
})
hl.window_rule({
  match = {
    class = expand("^(chrome-.+-Default)$"),
  },
  tag = "+browser",
})
hl.window_rule({
  match = {
    class = expand("^([Cc]hromium)$"),
  },
  tag = "+browser",
})
hl.window_rule({
  match = {
    class = expand("^([Mm]icrosoft-edge(-stable|-beta|-dev|-unstable))$"),
  },
  tag = "+browser",
})
hl.window_rule({
  match = {
    class = expand("^(Brave-browser(-beta|-dev|-unstable)?)$"),
  },
  tag = "+browser",
})
hl.window_rule({
  match = {
    class = expand("^([Tt]horium-browser|[Cc]achy-browser)$"),
  },
  tag = "+browser",
})
hl.window_rule({
  match = {
    class = expand("^(zen-alpha|zen)$"),
  },
  tag = "+browser",
})
hl.window_rule({
  match = {
    class = expand("^(swaync-control-center|swaync-notification-window|swaync-client|class)$"),
  },
  tag = "+notif",
})
hl.window_rule({
  match = {
    title = expand("^(KooL Quick Cheat Sheet)$"),
  },
  tag = "+KooL_Cheat",
})
hl.window_rule({
  match = {
    title = expand("^(KooL Hyprland Settings)$"),
  },
  tag = "+KooL_Settings",
})
hl.window_rule({
  match = {
    class = expand("^(nwg-displays|nwg-look)$"),
  },
  tag = "+KooL-Settings",
})
hl.window_rule({
  match = {
    class = expand("^(Alacritty|kitty|kitty-dropterm)$"),
  },
  tag = "+terminal",
})
hl.window_rule({
  match = {
    class = expand("^([Tt]hunderbird|org.mozilla.Thunderbird)$"),
  },
  tag = "+email",
})
hl.window_rule({
  match = {
    class = expand("^(eu.betterbird.Betterbird)$"),
  },
  tag = "+email",
})
hl.window_rule({
  match = {
    class = expand("^(org.gnome.Evolution)$"),
  },
  tag = "+email",
})
hl.window_rule({
  match = {
    class = expand("^(codium|codium-url-handler|VSCodium)$"),
  },
  tag = "+projects",
})
hl.window_rule({
  match = {
    class = expand("^(VSCode|code|code-url-handler)$"),
  },
  tag = "+projects",
})
hl.window_rule({
  match = {
    class = expand("^(jetbrains-.+)$"),
  },
  tag = "+projects",
})
hl.window_rule({
  match = {
    class = expand("^(dev.zed.Zed|antigravity)$"),
  },
  tag = "+projects",
})
hl.window_rule({
  match = {
    class = expand("^(com.obsproject.Studio)$"),
  },
  tag = "+screenshare",
})
hl.window_rule({
  match = {
    class = expand("^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$"),
  },
  tag = "+im",
})
hl.window_rule({
  match = {
    class = expand("^([Ff]erdium)$"),
  },
  tag = "+im",
})
hl.window_rule({
  match = {
    class = expand("^([Ww]hatsapp-for-linux)$"),
  },
  tag = "+im",
})
hl.window_rule({
  match = {
    class = expand("^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$"),
  },
  tag = "+im",
})
hl.window_rule({
  match = {
    class = expand("^(teams-for-linux)$"),
  },
  tag = "+im",
})
hl.window_rule({
  match = {
    class = expand("^(im.riot.Riot|Element)$"),
  },
  tag = "+im",
})
hl.window_rule({
  match = {
    class = expand("^(gamescope)$"),
  },
  tag = "+games",
})
hl.window_rule({
  match = {
    class = expand("^(steam_app_\\\\d+)$"),
  },
  tag = "+games",
})
hl.window_rule({
  match = {
    class = expand("^([Ss]team)$"),
  },
  tag = "+gamestore",
})
hl.window_rule({
  match = {
    title = expand("^([Ll]utris)$"),
  },
  tag = "+gamestore",
})
hl.window_rule({
  match = {
    class = expand("^(com.heroicgameslauncher.hgl)$"),
  },
  tag = "+gamestore",
})
hl.window_rule({
  match = {
    class = expand("^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$"),
  },
  tag = "+file-manager",
})
hl.window_rule({
  match = {
    class = expand("^(app.drey.Warp)$"),
  },
  tag = "+file-manager",
})
hl.window_rule({
  match = {
    class = expand("^([Ww]aytrogen)$"),
  },
  tag = "+wallpaper",
})
hl.window_rule({
  match = {
    class = expand("^([Aa]udacious)$"),
  },
  tag = "+multimedia",
})
hl.window_rule({
  match = {
    class = expand("^([Mm]pv|vlc)$"),
  },
  tag = "+multimedia_video",
})
hl.window_rule({
  match = {
    title = expand("^(ROG Control)$"),
  },
  tag = "+settings",
})
hl.window_rule({
  match = {
    class = expand("^(wihotspot(-gui)?)$"),
  },
  tag = "+settings",
})
hl.window_rule({
  match = {
    class = expand("^([Bb]aobab|org.gnome.[Bb]aobab)$"),
  },
  tag = "+settings",
})
hl.window_rule({
  match = {
    class = expand("^(gnome-disks|wihotspot(-gui)?)$"),
  },
  tag = "+settings",
})
hl.window_rule({
  match = {
    title = "(Kvantum Manager)",
  },
  tag = "+settings",
})
hl.window_rule({
  match = {
    class = expand("^(file-roller|org.gnome.FileRoller)$"),
  },
  tag = "+settings",
})
hl.window_rule({
  match = {
    class = expand("^(nm-applet|nm-connection-editor|blueman-manager)$"),
  },
  tag = "+settings",
})
hl.window_rule({
  match = {
    class = expand("^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"),
  },
  tag = "+settings",
})
hl.window_rule({
  match = {
    class = expand("^(qt5ct|qt6ct)$"),
  },
  tag = "+settings",
})
hl.window_rule({
  match = {
    class = "(xdg-desktop-portal-gtk)",
  },
  tag = "+settings",
})
hl.window_rule({
  match = {
    class = expand("^(org.kde.polkit-kde-authentication-agent-1)$"),
  },
  tag = "+settings",
})
hl.window_rule({
  match = {
    class = expand("^([Rr]ofi)$"),
  },
  tag = "+settings",
})
hl.window_rule({
  match = {
    class = expand("^(btrfs-assistant)$"),
  },
  tag = "+settings",
})
hl.window_rule({
  match = {
    class = expand("^(timeshift-gtk)$"),
  },
  tag = "+settings",
})
hl.window_rule({
  match = {
    class = expand("^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$"),
  },
  tag = "+viewer",
})
hl.window_rule({
  match = {
    class = expand("^(evince)$"),
  },
  tag = "+viewer",
})
hl.window_rule({
  match = {
    class = expand("^(eog|org.gnome.Loupe)$"),
  },
  tag = "+viewer",
})
hl.window_rule({
  match = {
    tag = "multimedia_video",
  },
  no_blur = true,
})
hl.window_rule({
  match = {
    tag = "multimedia_video",
  },
  opacity = "1.0",
})
hl.window_rule({
  match = {
    tag = "multimedia",
  },
  no_blur = true,
})
hl.window_rule({
  match = {
    tag = "multimedia",
  },
  opacity = "1.0",
})
hl.window_rule({
  match = {
    tag = "KooL_Cheat",
  },
  center = true,
})
hl.window_rule({
  match = {
    tag = "KooL-Settings",
  },
  center = true,
})
hl.window_rule({
  match = {
    title = expand("^(ROG Control)$"),
  },
  center = true,
})
hl.window_rule({
  match = {
    title = expand("^(Keybindings)$"),
  },
  center = true,
})
hl.window_rule({
  match = {
    class = expand("^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"),
  },
  center = true,
})
hl.window_rule({
  match = {
    class = expand("^([Ff]erdium)$"),
  },
  center = true,
})
hl.window_rule({
  match = {
    fullscreen = true,
  },
  idle_inhibit = "fullscreen",
})
hl.window_rule({
  match = {
    fullscreen = true,
  },
  idle_inhibit = "fullscreen",
})
hl.window_rule({
  match = {
    class = expand("^.*$"),
  },
  idle_inhibit = "fullscreen",
})
hl.window_rule({
  match = {
    title = expand("^.*$"),
  },
  idle_inhibit = "fullscreen",
})
hl.window_rule({
  match = {
    tag = "KooL_Cheat",
  },
  float = true,
})
hl.window_rule({
  match = {
    tag = "wallpaper",
  },
  float = true,
  center = true,
})
hl.window_rule({
  match = {
    tag = "settings",
  },
  float = true,
  center = true,
})
hl.window_rule({
  match = {
    tag = "viewer",
  },
  float = true,
  center = true,
})
hl.window_rule({
  match = {
    tag = "KooL-Settings",
  },
  float = true,
  center = true,
})
hl.window_rule({
  match = {
    class = "([Zz]oom|onedriver|onedriver-launcher)",
  },
  float = true,
})
hl.window_rule({
  match = {
    class = "(org.gnome.Calculator|qalculate-gtk)",
  },
  float = true,
})
hl.window_rule({
  match = {
    class = expand("^(mpv|com.github.rafostar.Clapper)$"),
  },
  float = true,
})
hl.window_rule({
  match = {
    class = expand("^([Qq]alculate-gtk)$"),
  },
  float = true,
})
hl.window_rule({
  match = {
    class = expand("^([Ff]erdium)$"),
  },
  float = true,
})
hl.window_rule({
  match = {
    title = expand("^(Authentication Required)$"),
  },
  float = true,
  center = true,
})
hl.window_rule({
  match = {
    class = "(codium|codium-url-handler|VSCodium)",
    title = "negative:(.*codium.*|.*VSCodium.*)",
  },
  float = true,
})
hl.window_rule({
  match = {
    class = expand("^(com.heroicgameslauncher.hgl)$"),
    title = "negative:(Heroic Games Launcher)",
  },
  float = true,
})
hl.window_rule({
  match = {
    class = expand("^([Ss]team)$"),
    title = expand("negative:^([Ss]team)$"),
  },
  float = true,
})
hl.window_rule({
  match = {
    title = expand("^(Add Folder to Workspace)$"),
  },
  float = true,
  size = { "monitor_w*0.7", "monitor_h*0.6" },
  center = true,
})
hl.window_rule({
  match = {
    title = expand("^(Save As)$"),
  },
  float = true,
  size = { "monitor_w*0.7", "monitor_h*0.6" },
  center = true,
})
hl.window_rule({
  match = {
    initial_title = "(Open Files)",
  },
  float = true,
  size = { "monitor_w*0.7", "monitor_h*0.6" },
})
hl.window_rule({
  match = {
    title = expand("^(SDDM Background)$"),
  },
  float = true,
  center = true,
  size = { "monitor_w*0.16", "monitor_h*0.12" },
})
hl.window_rule({
  match = {
    class = expand("^(yad)$"),
  },
  float = true,
  center = true,
  size = { "monitor_w*0.2", "monitor_h*0.2" },
})
hl.window_rule({
  match = {
    class = expand("^(hyprland-donate-screen)$"),
  },
  float = true,
  center = true,
})
hl.window_rule({
  match = {
    tag = "browser",
  },
  opacity = "0.99 0.8",
})
hl.window_rule({
  match = {
    tag = "projects",
  },
  opacity = "0.9 0.8",
})
hl.window_rule({
  match = {
    tag = "im",
  },
  opacity = "0.94 0.86",
})
hl.window_rule({
  match = {
    tag = "multimedia",
  },
  opacity = "0.94 0.86",
})
hl.window_rule({
  match = {
    tag = "file-manager",
  },
  opacity = "0.9 0.8",
})
hl.window_rule({
  match = {
    tag = "terminal",
  },
  opacity = "0.9 0.7",
})
hl.window_rule({
  match = {
    tag = "settings",
  },
  opacity = "0.8 0.7",
})
hl.window_rule({
  match = {
    tag = "viewer",
  },
  opacity = "0.82 0.75",
})
hl.window_rule({
  match = {
    tag = "wallpaper",
  },
  opacity = "0.9 0.7",
})
hl.window_rule({
  match = {
    class = expand("^(gedit|org.gnome.TextEditor|mousepad)$"),
  },
  opacity = "0.8 0.7",
})
hl.window_rule({
  match = {
    class = expand("^(deluge)$"),
  },
  opacity = "0.9 0.8",
})
hl.window_rule({
  match = {
    class = expand("^(seahorse)$"),
  },
  opacity = "0.9 0.8",
})
hl.window_rule({
  match = {
    title = expand("^(Picture-in-Picture)$"),
  },
  opacity = "0.95 0.75",
})
hl.window_rule({
  match = {
    tag = "KooL_Cheat",
  },
  size = { "monitor_w*0.65", "monitor_h*0.9" },
})
hl.window_rule({
  match = {
    tag = "wallpaper",
  },
  size = { "monitor_w*0.7", "monitor_h*0.7" },
})
hl.window_rule({
  match = {
    tag = "settings",
  },
  size = { "monitor_w*0.7", "monitor_h*0.7" },
})
hl.window_rule({
  match = {
    class = expand("^([Ff]erdium)$"),
  },
  size = { "monitor_w*0.6", "monitor_h*0.7" },
})
hl.window_rule({
  match = {
    tag = "games",
  },
  no_blur = true,
  fullscreen = 0,
})
hl.window_rule({
  match = {
    tag = "games",
  },
  fullscreen = 0,
})
hl.window_rule({
  match = {
    class = "^(jetbrains-*)",
  },
  no_initial_focus = true,
})
hl.window_rule({
  match = {
    title = expand("^(wind.*)$"),
  },
  no_initial_focus = true,
})
hl.layer_rule({
  match = {
    namespace = "rofi",
  },
  blur = true,
})
hl.layer_rule({
  match = {
    namespace = "notifications",
  },
  blur = true,
})
hl.layer_rule({
  match = {
    namespace = "quickshell:overview",
  },
  blur = true,
})
hl.layer_rule({
  match = {
    namespace = "quickshell:overview",
  },
  ignore_alpha = 0.5,
})
hl.window_rule({
  match = {
    class = expand("^([Ww]hatsapp-for-linux|ZapZap|com.rtosta.zapzap)$"),
  },
  name = "Whatsapp-zapzap",
  size = { "monitor_w*0.6", "monitor_h*0.7" },
  center = true,
})
hl.window_rule({
  match = {
    title = expand("^(Picture-in-Picture)$"),
  },
  name = "Picture-in-Picture",
  float = true,
  move = { "72%", "7%" },
  opacity = "0.95 0.75",
  pin = true,
  keep_aspect_ratio = true,
  size = { "monitor_w*0.3", "monitor_h*0.3" },
})
hl.window_rule({
  match = {
    class = expand("^(thunar)$"),
    title = expand("^(File Operation Progress)$"),
  },
  name = "Thunar-Progress-bar",
  float = true,
  center = true,
  size = { "monitor_w*0.26", "monitor_h*0.18" },
})

-- Source: UserConfigs/WindowRules.conf
