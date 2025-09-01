return {
  'NickvanDyke/opencode.nvim',
  dependencies = {
    'folke/snacks.nvim'
  },
  config = function()
    require('opencode').setup()

    vim.keymap.set('n', '<leader>aa', function() require('opencode').ask() end)
    vim.keymap.set('x', '<leader>aa', function() require('opencode').ask('@selection ') end)
  end
}
