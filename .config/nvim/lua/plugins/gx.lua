return {
  'chrishrb/gx.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('gx').setup()

    vim.keymap.set({'n', 'x'}, 'gx', '<cmd>Browse<CR>')
  end
}
