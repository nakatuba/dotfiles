return {
  'NickvanDyke/opencode.nvim',
  dependencies = {
    'folke/snacks.nvim'
  },
  config = function()
    vim.keymap.set('n', '<leader>aa', function() require('opencode').ask('@cursor ') end)
    vim.keymap.set('x', '<leader>aa', function() require('opencode').ask('@selection ') end)
    vim.keymap.set('n', '<leader>as', function() require('opencode').prompt('@buffer', { append = true }) end)
    vim.keymap.set('x', '<leader>as', function() require('opencode').prompt('@selection', { append = true }) end)
  end
}
