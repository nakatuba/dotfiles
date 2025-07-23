return {
  'folke/edgy.nvim',
  config = function()
    require('edgy').setup {
      left = {
        {
          ft = 'NvimTree',
          size = { width = 0.2 }
        }
      },
      bottom = {
        {
          ft = 'toggleterm',
          size = { height = 0.3 },
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ''
          end
        }
      },
      animate = {
        enabled = false,
      },
      wo = {
        winbar = false,
        winhighlight = ''
      }
    }
  end
}
