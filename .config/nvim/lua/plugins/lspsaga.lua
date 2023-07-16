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

    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      command = 'highlight! link SagaBorder TelescopeBorder'
    })

    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      command = 'highlight! link SagaNormal TelescopeNormal'
    })

    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      command = 'highlight! link SagaFileName Normal'
    })

    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      command = 'highlight! link SagaFolderName Normal'
    })

    vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>')
  end
}
