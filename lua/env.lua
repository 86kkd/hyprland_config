local environment = {
  DOTS_VERSION = "2.3.20",
  GDK_BACKEND = "wayland,x11,*",
  QT_QPA_PLATFORM = "wayland;xcb",
  CLUTTER_BACKEND = "wayland",
  XDG_CURRENT_DESKTOP = "Hyprland",
  XDG_SESSION_DESKTOP = "Hyprland",
  XDG_SESSION_TYPE = "wayland",
  QT_AUTO_SCREEN_SCALE_FACTOR = "1",
  QT_WAYLAND_DISABLE_WINDOWDECORATION = "1",
  QT_QPA_PLATFORMTHEME = "qt6ct",
  QT_QUICK_CONTROLS_STYLE = "org.hyprland.style",
  GDK_SCALE = "1",
  QT_SCALE_FACTOR = "1",
  MOZ_ENABLE_WAYLAND = "1",
  ELECTRON_OZONE_PLATFORM_HINT = "auto",
}

for name, value in pairs(environment) do
  hl.env(name, value)
end
