local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.font = wezterm.font('MesloLGS NF')
config.keys = require('keys')
config.macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL'
config.window_background_opacity = 0.75

return config
