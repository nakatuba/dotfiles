return {
  'tummetott/reticle.nvim',
  config = function()
    require('reticle').setup {
      never = {
        cursorline = {
          'snacks_terminal',
          'toggleterm'
        }
      }
    }
  end
}
