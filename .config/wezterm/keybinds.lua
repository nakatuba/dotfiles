local M = {}
local wezterm = require('wezterm')

wezterm.on('toggle-opacity', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.8
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end)

M.keys = {
  {
    key = 'c',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.ActivateCopyMode
  },
  {
    key = '[',
    mods = 'SUPER',
    action = wezterm.action.ActivatePaneDirection 'Prev'
  },
  {
    key = ']',
    mods = 'SUPER',
    action = wezterm.action.ActivatePaneDirection 'Next'
  },
  {
    key = 'u',
    mods = 'SUPER',
    action = wezterm.action.EmitEvent 'toggle-opacity'
  },
  {
    key = '/',
    mods = 'CTRL',
    action = wezterm.action.SendString '\x1f'
  },
  {
    key = 'd',
    mods = 'SUPER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'd',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'Enter',
    mods = 'SUPER',
    action = wezterm.action.ToggleFullScreen
  },
  {
    key = 'Enter',
    mods = 'SHIFT',
    action = wezterm.action.SendString '\n'
  }
}

return M
