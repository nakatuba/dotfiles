return {
  'szw/vim-maximizer',
  init = function()
    vim.g.maximizer_set_default_mapping = false
  end,
  config = function()
    vim.keymap.set('n', '<CR>', '<cmd>MaximizerToggle<CR>')
  end
}
