return {
  'tummetott/reticle.nvim',
  config = function()
    require('reticle').setup {
      never = {
        cursorline = {
          'toggleterm'
        }
      }
    }
  end
}
