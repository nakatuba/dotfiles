return {
  'tummetott/reticle.nvim',
  config = function()
    require('reticle').setup {
      never = {
        cursorline = {
          'opencode_terminal',
          'snacks_terminal',
          'toggleterm'
        }
      }
    }
  end
}
