local H = HyprLua
local vars = H.vars
local expand = H.expand

vars.mainMod = "SUPER"
vars.scriptsDir = expand("$HOME/.config/hypr/scripts")
vars.UserConfigs = expand("$HOME/.config/hypr/UserConfigs")
vars.Touchpad_Device = "asue1209:00-04f3:319f-touchpad"
hl.bind("XF86KbdBrightnessDown", hl.dsp.exec_cmd(expand("$scriptsDir/BrightnessKbd.sh --dec")), {
  repeating = true,
})
hl.bind("XF86KbdBrightnessUp", hl.dsp.exec_cmd(expand("$scriptsDir/BrightnessKbd.sh --inc")), {
  repeating = true,
})
hl.bind("XF86Launch1", hl.dsp.exec_cmd(expand("rog-control-center")))
hl.bind("XF86Launch3", hl.dsp.exec_cmd(expand("asusctl led-mode -n")))
hl.bind("XF86Launch4", hl.dsp.exec_cmd(expand("asusctl profile -n")))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(expand("$scriptsDir/Brightness.sh --dec")), {
  repeating = true,
})
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(expand("$scriptsDir/Brightness.sh --inc")), {
  repeating = true,
})
hl.bind("XF86TouchpadToggle", hl.dsp.exec_cmd(expand("$scriptsDir/TouchPad.sh")))
hl.bind("SUPER + F6", hl.dsp.exec_cmd(expand("$scriptsDir/ScreenShot.sh --now")))
hl.bind("SUPER + SHIFT + F6", hl.dsp.exec_cmd(expand("$scriptsDir/ScreenShot.sh --area")))
hl.bind("SUPER + CTRL + F6", hl.dsp.exec_cmd(expand("$scriptsDir/ScreenShot.sh --in5")))
hl.bind("SUPER + ALT + F6", hl.dsp.exec_cmd(expand("$scriptsDir/ScreenShot.sh --in10")))
hl.bind("ALT + F6", hl.dsp.exec_cmd(expand("$scriptsDir/ScreenShot.sh --active")))
vars.TOUCHPAD_ENABLED = "true"
hl.device({
  name = expand("$Touchpad_Device"),
  enabled = true,
})
