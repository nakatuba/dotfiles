return {
  'NickvanDyke/opencode.nvim',
  dependencies = {
    'folke/snacks.nvim'
  },
  config = function()
    vim.g.opencode_opts = {
      on_opencode_not_found = function()
        vim.system({ 'tmux', 'split-window', '-h', 'opencode' })
      end
    }

    vim.keymap.set('n', '<leader>as', function() require('opencode').prompt('@buffer') end)
    vim.keymap.set('x', '<leader>as', function() require('opencode').prompt('@selection') end)
  end
}
