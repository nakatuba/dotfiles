if not pcall(require, 'windex') then return end

require('windex').setup {
  default_keymaps = false
}

vim.keymap.set('n', '<CR>', "<cmd>lua require('windex').toggle_nvim_maximize()<CR>")
