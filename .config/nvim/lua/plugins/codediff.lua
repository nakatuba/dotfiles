return {
  'esmuellert/codediff.nvim',
  config = function()
    require('codediff').setup {
      diff = {
        compact = true
      },
      explorer = {
        initial_focus = 'modified',
        view_mode = 'tree',
        focus_on_select = true,
        auto_open_on_cursor = true
      },
      keymaps = {
        view = {
          close_on_open_in_prev_tab = true
        }
      }
    }

    vim.keymap.set('n', 'ghd', function()
      local ok, gs_config = pcall(require, 'gitsigns.config')
      local base = ok and gs_config.config.base or nil
      vim.cmd('CodeDiff' .. (base and (' ' .. base) or ''))
    end)
  end
}
