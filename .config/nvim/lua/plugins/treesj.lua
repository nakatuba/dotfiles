return {
  'Wansmer/treesj',
  dependencies = {
    'nvim-treesitter/nvim-treesitter'
  },
  config = function()
    require('treesj').setup {
      use_default_keymaps = false
    }

    vim.keymap.set('n', 'gm', '<cmd>TSJToggle<CR>')
  end
}
