return {
  'utilyre/barbecue.nvim',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('barbecue').setup {
      show_modified = true,
      show_navic = false,
      theme = {
        dirname = { bold = true }
      }
    }
  end
}
