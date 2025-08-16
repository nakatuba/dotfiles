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

    vim.keymap.set('n', '<leader>af', '<cmd>ClaudeCodeFocus<CR>')
    vim.keymap.set('n', '<leader>ab', '<cmd>ClaudeCodeAdd %<CR>')
    vim.keymap.set('x', '<leader>as', '<cmd>ClaudeCodeSend<CR>')
    vim.keymap.set('n', '<leader>aa', '<cmd>ClaudeCodeDiffAccept<CR>')
    vim.keymap.set('n', '<leader>ad', '<cmd>ClaudeCodeDiffDeny<CR>')
  end
}
