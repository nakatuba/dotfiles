return {
  'kwkarlwang/bufjump.nvim',
  config = function()
    require('bufjump').setup {
      forward = 'g<C-i>',
      backward = 'g<C-o>'
    }
  end
}
