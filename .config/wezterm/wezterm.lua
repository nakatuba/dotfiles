local wezterm = require('wezterm')
local mux = wezterm.mux
local config = wezterm.config_builder()

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

config.adjust_window_size_when_changing_font_size = false
config.font = wezterm.font('MesloLGS NF')
config.hide_tab_bar_if_only_one_tab = true
config.keys = require('keys')
config.macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL'
config.window_background_opacity = 0.8

return config
