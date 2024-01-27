return {
  'caenrique/swap-buffers.nvim',
  config = function()
    vim.keymap.set('n', '<M-h>', function() require('swap-buffers').swap_buffers('h') end)
    vim.keymap.set('n', '<M-j>', function() require('swap-buffers').swap_buffers('j') end)
    vim.keymap.set('n', '<M-k>', function() require('swap-buffers').swap_buffers('k') end)
    vim.keymap.set('n', '<M-l>', function() require('swap-buffers').swap_buffers('l') end)
  end
}
