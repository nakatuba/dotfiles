if not pcall(require, 'focus') then return end

require('focus').setup {
  autoresize = false,
  signcolumn = false
}

vim.keymap.set('n', '<CR>', '<cmd>FocusMaxOrEqual<CR>')
