require('lazy').setup {
  { import = 'plugins.Comment' },
  { import = 'plugins.dial' },
  { import = 'plugins.hop' },
  { import = 'plugins.nvim-surround' },
  { import = 'plugins.substitute' },
  { import = 'plugins.treesj' },
  { import = 'plugins.vim-easy-align' },
  { import = 'plugins.vim-operator-convert-case' },
  { import = 'plugins.vim-swap' },
  { import = 'plugins.vim-textobj-comment' },
  { import = 'plugins.vim-textobj-entire' },
  { import = 'plugins.vim-textobj-jsxattr' }
}

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    if vim.v.event.operator == 'y' and vim.v.event.regname == '' then
      vim.fn.setreg('*', vim.fn.getreg('"'))
    end
  end
})

vim.keymap.set('n', 'u',          function() vim.fn.VSCodeNotify('undo') end)
vim.keymap.set('n', '<C-r>',      function() vim.fn.VSCodeNotify('redo') end)
vim.keymap.set('n', 'gd',         function() vim.fn.VSCodeNotify('editor.action.revealDefinition') end)
vim.keymap.set('n', 'gi',         function() vim.fn.VSCodeNotify('editor.action.goToImplementation') end)
vim.keymap.set('n', 'gr',         function() vim.fn.VSCodeNotify('editor.action.goToReferences') end)
vim.keymap.set('n', 'K',          function() vim.fn.VSCodeNotify('editor.action.showHover') end)
vim.keymap.set('n', '<Leader>rn', function() vim.fn.VSCodeNotify('editor.action.rename') end)
vim.keymap.set('n', '<Leader>ca', function() vim.fn.VSCodeNotify('editor.action.quickFix') end)
vim.keymap.set('n', '<Leader>f',  function() vim.fn.VSCodeNotify('workbench.action.quickOpen') end)
vim.keymap.set('n', '<Leader>b',  function() vim.fn.VSCodeNotify('workbench.action.showAllEditors') end)
vim.keymap.set('n', '<Leader>e',  function() vim.fn.VSCodeNotify('workbench.view.explorer') end)
vim.keymap.set('n', '<CR>',       function() vim.fn.VSCodeNotify('workbench.action.toggleEditorWidths') end)
