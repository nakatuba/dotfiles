return {
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('aerial').setup {
      layout = {
        max_width = 0.9,
        min_width = 30,
        placement = 'edge',
        preserve_equality = true
      },
      attach_mode = 'global',
      manage_folds = true,
      on_attach = function(bufnr)
        vim.keymap.set('n', '<C-k>', '<cmd>AerialPrev<CR>', { buffer = bufnr })
        vim.keymap.set('n', '<C-j>', '<cmd>AerialNext<CR>', { buffer = bufnr })
      end
    }

    vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle!<CR>')
  end
}
