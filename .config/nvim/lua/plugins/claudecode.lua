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
  end
}
