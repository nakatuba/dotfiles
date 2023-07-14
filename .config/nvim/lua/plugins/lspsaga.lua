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
        in_select = false,
        keys = {
          quit = '<Esc>',
        }
      },
      outline = {
        layout = 'float',
        keys = {
          quit = '<Esc>',
          jump = { 'o', '<CR>' }
        }
      }
    }

    vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>')
  end
}
