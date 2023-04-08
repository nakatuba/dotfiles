require('mappings')
require('options')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath
  }
end
vim.opt.rtp:prepend(lazypath)

if vim.g.vscode then
  require('lazy').setup {
    { import = 'plugins.dial' },
    { import = 'plugins.hop' },
    { import = 'plugins.substitute' },
    { import = 'plugins.treesj' },
    { import = 'plugins.vim-commentary' },
    { import = 'plugins.vim-repeat' },
    { import = 'plugins.vim-surround' },
    { import = 'plugins.vim-swap' },
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
  vim.keymap.set('n', '<Leader>s',  function() vim.fn.VSCodeNotify('workbench.action.gotoSymbol') end)
  vim.keymap.set('n', '<Leader>f',  function() vim.fn.VSCodeNotify('workbench.action.quickOpen') end)
  vim.keymap.set('n', '<Leader>b',  function() vim.fn.VSCodeNotify('workbench.action.showAllEditors') end)
  vim.keymap.set('n', '<Leader>e',  function() vim.fn.VSCodeNotify('workbench.view.explorer') end)
else
  require('lazy').setup('plugins', {
    change_detection = {
      notify = false
    }
  })

  vim.cmd.colorscheme('sonokai')
end
