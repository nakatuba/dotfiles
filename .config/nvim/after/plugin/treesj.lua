if not pcall(require, 'treesj') then return end

require('treesj').setup {
  use_default_keymaps = false
}

vim.keymap.set('n', '<leader>m', '<cmd>TSJToggle<CR>')
