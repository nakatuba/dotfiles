require('lazy').setup {
  { import = 'plugins.Comment' },
  { import = 'plugins.dial' },
  { import = 'plugins.gx' },
  { import = 'plugins.hop' },
  { import = 'plugins.nvim-surround' },
  { import = 'plugins.substitute' },
  { import = 'plugins.treesj' },
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

vim.keymap.set('n', 'u',          function() require('vscode-neovim').call('undo') end)
vim.keymap.set('n', '<C-r>',      function() require('vscode-neovim').call('redo') end)
vim.keymap.set('n', 'gd',         function() require('vscode-neovim').call('editor.action.revealDefinition') end)
vim.keymap.set('n', 'gi',         function() require('vscode-neovim').call('editor.action.goToImplementation') end)
vim.keymap.set('n', 'gr',         function() require('vscode-neovim').call('editor.action.goToReferences') end)
vim.keymap.set('n', 'K',          function() require('vscode-neovim').call('editor.action.showHover') end)
vim.keymap.set('n', '<Leader>rn', function() require('vscode-neovim').call('editor.action.rename') end)
vim.keymap.set('n', '<Leader>ca', function() require('vscode-neovim').call('editor.action.quickFix') end)
vim.keymap.set('n', '<Leader>f',  function() require('vscode-neovim').call('workbench.action.quickOpen') end)
vim.keymap.set('n', '<Leader>b',  function() require('vscode-neovim').call('workbench.action.showAllEditors') end)
vim.keymap.set('n', '<Leader>e',  function() require('vscode-neovim').call('workbench.view.explorer') end)
vim.keymap.set('n', '<CR>',       function() require('vscode-neovim').call('workbench.action.toggleEditorWidths') end)
