return {
  'glts/vim-textobj-comment',
  dependencies = {
    'kana/vim-textobj-user'
  },
  init = function ()
    vim.g.textobj_comment_no_default_key_mappings = 1
  end,
  config = function ()
    vim.keymap.set('o', 'ic', '<Plug>(textobj-comment-i)')
    vim.keymap.set('x', 'ic', '<Plug>(textobj-comment-i)')
    vim.keymap.set('o', 'ac', '<Plug>(textobj-comment-a)')
    vim.keymap.set('x', 'ac', '<Plug>(textobj-comment-a)')
  end
}
