local wezterm = require('wezterm')
local mux = wezterm.mux
local config = wezterm.config_builder()

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

config.font = wezterm.font('MesloLGS NF')
config.keys = require('keys')
config.macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL'
config.window_background_opacity = 0.75

return config
