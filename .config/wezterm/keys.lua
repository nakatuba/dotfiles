local wezterm = require('wezterm')

return {
  {
    key = '/',
    mods = 'CTRL',
    action = wezterm.action { SendString = '\x1f' }
  }
}
