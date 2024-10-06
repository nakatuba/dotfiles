return {
  'stevearc/aerial.nvim',
  config = function()
    require('aerial').setup {
      layout = {
        min_width = 40,
        placement = 'edge',
        preserve_equality = true
      },
      attach_mode = 'global',
      on_attach = function(bufnr)
        vim.keymap.set('n', '<C-k>', '<cmd>AerialPrev<CR>', { buffer = bufnr })
        vim.keymap.set('n', '<C-j>', '<cmd>AerialNext<CR>', { buffer = bufnr })
      end
    }

    vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle!<CR>')
  end
}
