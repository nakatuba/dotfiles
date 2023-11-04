return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup {
      symbol_in_winbar = {
        enable = false
      },
      outline = {
        win_width = math.floor(vim.o.columns * 0.25),
        keys = {
          jump = { 'o', '<CR>' }
        }
      }
    }

    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      command = 'highlight! link SagaBorder Blue'
    })

    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      command = 'highlight! link SagaNormal Normal'
    })

    vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>')
  end
}
