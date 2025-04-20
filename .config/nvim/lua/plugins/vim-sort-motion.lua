return {
  'christoomey/vim-sort-motion',
  config = function()
    vim.keymap.set('n', 'go',  '<Plug>SortMotion')
    vim.keymap.set('n', 'goo', '<Plug>SortLines')
    vim.keymap.set('x', 'go',  '<Plug>SortMotionVisual')
  end
}
