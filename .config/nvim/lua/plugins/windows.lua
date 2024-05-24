return {
  'anuvyklack/windows.nvim',
  dependencies = {
    'anuvyklack/middleclass'
  },
  config = function()
    require('windows').setup()

    vim.keymap.set('n', '<CR>', '<cmd>WindowsMaximize<CR>')
  end
}
