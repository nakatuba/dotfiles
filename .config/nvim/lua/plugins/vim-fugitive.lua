return {
  'tpope/vim-fugitive',
  dependencies = {
    'tpope/vim-rhubarb'
  },
  config = function()
    vim.keymap.set('n', '<C-g><C-o>', '<cmd>GBrowse<CR>')
  end
}
