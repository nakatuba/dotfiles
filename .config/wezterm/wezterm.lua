local wezterm = require('wezterm')
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
  end
)

return {
  font_size = 10.0,
  warn_about_missing_glyphs = false,
  window_background_opacity = 0.75
}
