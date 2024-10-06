return {
  'declancm/maximize.nvim',
  config = function()
    require('maximize').setup()

    vim.keymap.set('n', '<CR>', '<cmd>Maximize<CR>')
  end
}
