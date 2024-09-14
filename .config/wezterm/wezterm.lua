local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.adjust_window_size_when_changing_font_size = false
config.font = wezterm.font('MesloLGS NF')
config.hide_tab_bar_if_only_one_tab = true
config.keys = require('keys')
config.macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL'

return config
