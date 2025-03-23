return {
  'mopp/vim-operator-convert-case',
  dependencies = {
    'kana/vim-operator-user'
  },
  config = function()
    vim.keymap.set('n', ',cc', '<cmd>ConvertCaseLoop<CR>')
  end
}
