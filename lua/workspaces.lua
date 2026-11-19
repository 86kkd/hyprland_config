-- Replaces deprecated dwindle.special_scale_factor = 0.8
-- ((1 - 0.8) / 2 = 10% margin on each side), per monitor logical size.
-- DP-2 is rotated (transform 3) → logical 1440x2560.
hl.workspace_rule({
  workspace = "s[true] m[DP-2]",
  gaps_out = {
    top = 256,
    right = 144,
    bottom = 256,
    left = 144,
  },
})

hl.workspace_rule({
  workspace = "s[true] m[DP-3]",
  gaps_out = {
    top = 216,
    right = 384,
    bottom = 216,
    left = 384,
  },
})
