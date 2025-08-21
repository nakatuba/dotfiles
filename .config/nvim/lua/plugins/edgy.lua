return {
  'folke/edgy.nvim',
  config = function()
    require('edgy').setup {
      left = {
        {
          ft = 'NvimTree',
          size = { width = 40 }
        }
      },
      bottom = {
        {
          ft = 'toggleterm',
          size = { height = 20 },
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ''
          end,
        }
      },
      right = {
        {
          ft = 'aerial',
          size = { width = 40 }
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
