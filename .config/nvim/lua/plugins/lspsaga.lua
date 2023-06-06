return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup {
      code_action = {
        keys = {
          quit = '<Esc>'
        }
      },
      rename = {
        quit = '<Esc>',
        in_select = false
      },
      outline = {
        keys = {
          expand_or_jump = '<CR>'
        }
      },
      symbol_in_winbar = {
        separator = ' > '
      }
    }

    vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>')
  end
}
