return {
  'folke/snacks.nvim',
  config = function()
    require('snacks').setup {
      image = {
        enable = true
      }
    }
  end
}
