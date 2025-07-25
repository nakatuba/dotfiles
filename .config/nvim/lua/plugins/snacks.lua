return {
  'folke/snacks.nvim',
  config = function()
    require('snacks').setup {
      image = {
        enable = true
      }
    }

    vim.keymap.set('n', '<CR>', require('snacks').zen.zoom)
  end
}
