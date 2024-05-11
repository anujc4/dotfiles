return {
  black = 0xb31d2021,
  white = 0xb3ebdbb2,
  red = 0xb3fb4934,
  green = 0xb3b8bb26,
  blue = 0xb383a598,
  yellow = 0xb3fabd2f,
  orange = 0xb3fe8019,
  magenta = 0xb3d3869b,
  grey = 0xb3a89984,
  transparent = 0x00000000,

  bar = {
    bg = 0xb31d2021,
    border = 0xb3ebdbb2,
  },
  popup = {
    bg = 0xb3a89984,
    border = 0xb3ebdbb2
  },
  bg1 = 0xb31d2021,
  bg2 = 0xff414550,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
