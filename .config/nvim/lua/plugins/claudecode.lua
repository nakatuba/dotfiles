return {
  'coder/claudecode.nvim',
  dependencies = {
    'folke/snacks.nvim'
  },
  config = function()
    require('claudecode').setup {
      terminal = {
        snacks_win_opts = {
          keys = {
            claude_hide = { '<M-Esc>', function(self) self:hide() end, mode = 't' }
          }
        }
      }
    }

    vim.keymap.set('n', '<M-Esc>', '<cmd>ClaudeCodeFocus<CR>')
    vim.keymap.set('x', '<M-Esc>', '<cmd>ClaudeCodeSend<CR>')
  end
}
