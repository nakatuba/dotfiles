return {
  'caenrique/swap-buffers.nvim',
  config = function ()
    vim.keymap.set('n', '<M-h>', "<cmd>lua require('swap-buffers').swap_buffers('h')<CR>")
    vim.keymap.set('n', '<M-j>', "<cmd>lua require('swap-buffers').swap_buffers('j')<CR>")
    vim.keymap.set('n', '<M-k>', "<cmd>lua require('swap-buffers').swap_buffers('k')<CR>")
    vim.keymap.set('n', '<M-l>', "<cmd>lua require('swap-buffers').swap_buffers('l')<CR>")
  end
}
