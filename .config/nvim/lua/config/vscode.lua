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
  group = vim.api.nvim_create_augroup('copy_to_clipboard', { clear = true }),
  callback = function()
    if vim.v.event.operator == 'y' and vim.v.event.regname == '' then
      vim.fn.setreg('*', vim.fn.getreg('"'))
    end
  end
})

vim.keymap.set('n', 'j',          function() require('vscode').call('cursorMove', { args = { to = 'down', by = 'wrappedLine', value = vim.v.count1 }}) end)
vim.keymap.set('n', 'k',          function() require('vscode').call('cursorMove', { args = { to = 'up',   by = 'wrappedLine', value = vim.v.count1 }}) end)
vim.keymap.set('n', 'u',          function() require('vscode').call('undo') end)
vim.keymap.set('n', '<C-r>',      function() require('vscode').call('redo') end)
vim.keymap.set('n', 'gd',         function() require('vscode').call('editor.action.revealDefinition') end)
vim.keymap.set('n', 'gi',         function() require('vscode').call('editor.action.goToImplementation') end)
vim.keymap.set('n', 'gr',         function() require('vscode').call('editor.action.goToReferences') end)
vim.keymap.set('n', 'K',          function() require('vscode').call('editor.action.showHover') end)
vim.keymap.set('n', '<Leader>rn', function() require('vscode').call('editor.action.rename') end)
vim.keymap.set('n', '<Leader>ca', function() require('vscode').call('editor.action.quickFix') end)
vim.keymap.set('n', '<Leader>f',  function() require('vscode').call('workbench.action.quickOpen') end)
vim.keymap.set('n', '<Leader>b',  function() require('vscode').call('workbench.action.showAllEditors') end)
vim.keymap.set('n', '<Leader>e',  function() require('vscode').call('workbench.view.explorer') end)
vim.keymap.set('n', 'ss',         function() require('vscode').call('workbench.action.splitEditorDown') end)
vim.keymap.set('n', 'sv',         function() require('vscode').call('workbench.action.splitEditorRight') end)
vim.keymap.set('n', 'sh',         function() require('vscode').call('workbench.action.navigateLeft') end)
vim.keymap.set('n', 'sj',         function() require('vscode').call('workbench.action.navigateDown') end)
vim.keymap.set('n', 'sk',         function() require('vscode').call('workbench.action.navigateUp') end)
vim.keymap.set('n', 'sl',         function() require('vscode').call('workbench.action.navigateRight') end)
vim.keymap.set('n', 'sq',         function() require('vscode').call('workbench.action.closeEditorsInGroup') end)
vim.keymap.set('n', 'so',         function() require('vscode').call('workbench.action.closeEditorsInOtherGroups') end)
vim.keymap.set('n', 's=',         function() require('vscode').call('workbench.action.evenEditorWidths') end)
vim.keymap.set('n', '<CR>',       function() require('vscode').call('workbench.action.toggleEditorWidths') end)
