return {
  'machakann/vim-swap',
  init = function()
    vim.g.swap_no_default_key_mappings = 1
  end,
  config = function()
    vim.keymap.set('n', 'g<', '<Plug>(swap-prev)')
    vim.keymap.set('n', 'g>', '<Plug>(swap-next)')
    vim.keymap.set('o', 'i,', '<Plug>(swap-textobject-i)')
    vim.keymap.set('x', 'i,', '<Plug>(swap-textobject-i)')
    vim.keymap.set('o', 'a,', '<Plug>(swap-textobject-a)')
    vim.keymap.set('x', 'a,', '<Plug>(swap-textobject-a)')
  end
}
