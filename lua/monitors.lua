-- Monitor layout. Position uses physical pixels; scale is per output.
hl.monitor({
  output = "DP-3",
  mode = "3840x2160@160.0",
  position = "1440x282",
  scale = 1.0,
})
hl.monitor({
  output = "DP-2",
  mode = "2560x1440@59.95",
  position = "0x118",
  scale = 1.0,
})
hl.monitor({
  output = "DP-2",
  transform = 3,
})
