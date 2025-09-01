return {
  'NickvanDyke/opencode.nvim',
  dependencies = {
    'folke/snacks.nvim'
  },
  config = function()
    vim.keymap.set('n', '<leader>aa', function() require('opencode').ask('@buffer ') end)
    vim.keymap.set('x', '<leader>aa', function() require('opencode').ask('@selection ') end)
  end
}
