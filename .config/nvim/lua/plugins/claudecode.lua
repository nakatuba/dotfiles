return {
  'coder/claudecode.nvim',
  dependencies = {
    'folke/snacks.nvim'
  },
  config = function()
    require('claudecode').setup {
      terminal = {
        provider = 'external',
        provider_opts = {
          external_terminal_cmd = 'tmux split-window -h %s'
        }
      }
    }

    vim.keymap.set('n', '<leader>as', '<cmd>ClaudeCodeAdd %<CR>')
    vim.keymap.set('x', '<leader>as', '<cmd>ClaudeCodeSend<CR>')
  end
}
