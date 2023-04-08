return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      open_mapping = '<C-Space>',
      direction = 'float'
    }
  end
}
