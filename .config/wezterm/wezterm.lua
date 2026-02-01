local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback { 'MesloLGS NF', 'Noto Sans CJK JP' }
config.hide_tab_bar_if_only_one_tab = true
config.keys = require('keybinds').keys
config.macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL'

return config
