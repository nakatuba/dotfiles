require('rc.mappings')
require('rc.options')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  -- Motion
  {
    'phaazon/hop.nvim',
    config = function ()
      require('rc.plugins.hop')
    end
  },

  -- Editing Support
  {
    'monaqa/dial.nvim',
    config = function ()
      require('rc.plugins.dial')
    end
  },
  {
    'gbprod/substitute.nvim',
    config = function ()
      require('rc.plugins.substitute')
    end
  },
  {
    'Wansmer/treesj',
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    },
    config = function ()
      require('rc.plugins.treesj')
    end
  },
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-commentary' },
  {
    'kana/vim-textobj-entire',
    dependencies = {
      'kana/vim-textobj-user'
    }
  },
  {
    'glts/vim-textobj-comment',
    dependencies = {
      'kana/vim-textobj-user'
    },
    init = function ()
      vim.g.textobj_comment_no_default_key_mappings = 1
    end,
    config = function ()
      require('rc.plugins.textobj-comment')
    end
  },
  {
    'inside/vim-textobj-jsxattr',
    dependencies = {
      'kana/vim-textobj-user'
    }
  },
  {
    'machakann/vim-swap',
    init = function ()
      vim.g.swap_no_default_key_mappings = 1
    end,
    config = function ()
      require('rc.plugins.swap')
    end
  }
}

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function ()
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
