require('lazy').setup {
  { import = 'plugins.Comment' },
  { import = 'plugins.dial' },
  { import = 'plugins.gx' },
  { import = 'plugins.hop' },
  { import = 'plugins.nvim-surround' },
  { import = 'plugins.nvim-treesitter' },
  { import = 'plugins.substitute' },
  { import = 'plugins.treesj' },
  { import = 'plugins.vim-operator-convert-case' },
  { import = 'plugins.vim-sort-motion' },
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

local vscode = require('vscode')

vim.keymap.set('n', 'j',          function() vscode.action('cursorMove', { args = { to = 'down', by = 'wrappedLine', value = vim.v.count1 }}) end)
vim.keymap.set('n', 'k',          function() vscode.action('cursorMove', { args = { to = 'up',   by = 'wrappedLine', value = vim.v.count1 }}) end)
vim.keymap.set('n', 'u',          function() vscode.action('undo') end)
vim.keymap.set('n', '<C-r>',      function() vscode.action('redo') end)
vim.keymap.set('n', '<C-k>',      function() vscode.action('gotoNextPreviousMember.previousMember') end)
vim.keymap.set('n', '<C-j>',      function() vscode.action('gotoNextPreviousMember.nextMember') end)
vim.keymap.set('n', '<leader>e',  function() vscode.action('workbench.view.explorer') end)
vim.keymap.set('n', '<leader>f',  function() vscode.action('workbench.action.quickOpen') end)
vim.keymap.set('n', '<leader>g',  function() vscode.action('workbench.action.findInFiles') end)
vim.keymap.set('n', '<leader>b',  function() vscode.action('workbench.action.showAllEditors') end)
vim.keymap.set('n', 'gd',         function() vscode.action('editor.action.revealDefinition') end)
vim.keymap.set('n', 'gi',         function() vscode.action('editor.action.goToImplementation') end)
vim.keymap.set('n', 'gr',         function() vscode.action('editor.action.goToReferences') end, { nowait = true })
vim.keymap.set('n', 'K',          function() vscode.action('editor.action.showHover') end)
vim.keymap.set('n', '<leader>rn', function() vscode.action('editor.action.rename') end)
vim.keymap.set('n', '<leader>ca', function() vscode.action('editor.action.quickFix') end)
vim.keymap.set('n', '<leader>s',  function() vscode.action('workbench.action.gotoSymbol') end)
vim.keymap.set('n', '<leader>d',  function() vscode.action('workbench.actions.view.problems') end)
vim.keymap.set('n', '[d',         function() vscode.action('editor.action.marker.prev') end)
vim.keymap.set('n', ']d',         function() vscode.action('editor.action.marker.next') end)
vim.keymap.set('n', 'ghr',        function() vscode.action('git.revertSelectedRanges') end)
vim.keymap.set('n', 'ghp',        function() vscode.action('editor.action.dirtydiff.next') end)
vim.keymap.set('n', 'ghb',        function() vscode.action('gitlens.toggleFileBlame') end)
vim.keymap.set('n', 'ghd',        function() vscode.action('git.openChange') end)
vim.keymap.set('n', '[c',         function() vscode.action('editor.action.dirtydiff.previous') end)
vim.keymap.set('n', ']c',         function() vscode.action('editor.action.dirtydiff.next') end)
vim.keymap.set('n', 'ss',         function() vscode.action('workbench.action.splitEditorDown') end)
vim.keymap.set('n', 'sv',         function() vscode.action('workbench.action.splitEditorRight') end)
vim.keymap.set('n', 'sh',         function() vscode.action('workbench.action.navigateLeft') end)
vim.keymap.set('n', 'sj',         function() vscode.action('workbench.action.navigateDown') end)
vim.keymap.set('n', 'sk',         function() vscode.action('workbench.action.navigateUp') end)
vim.keymap.set('n', 'sl',         function() vscode.action('workbench.action.navigateRight') end)
vim.keymap.set('n', 'sq',         function() vscode.action('workbench.action.closeEditorsInGroup') end)
vim.keymap.set('n', 'so',         function() vscode.action('workbench.action.closeEditorsInOtherGroups') end)
vim.keymap.set('n', 's=',         function() vscode.action('workbench.action.evenEditorWidths') end)
vim.keymap.set('n', '<CR>',       function() vscode.action('workbench.action.toggleEditorWidths') end)

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.keymap.set('n', '<leader>mp', function() vscode.action('markdown.showPreviewToSide') end, { buffer = true })
  end
})
