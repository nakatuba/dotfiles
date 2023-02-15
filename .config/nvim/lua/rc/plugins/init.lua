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
  -- Lsp
  {
    'neovim/nvim-lspconfig',
    config = function ()
      require('rc.plugins.lspconfig')
    end
  },
  {
    'glepnir/lspsaga.nvim',
    config = function ()
      require('rc.plugins.lspsaga')
    end
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function ()
      require('rc.plugins.null-ls')
    end
  },
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    config = function ()
      require('rc.plugins.mason')
    end
  },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/vim-vsnip'
    },
    config = function ()
      require('rc.plugins.cmp')
    end
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring'
    },
    config = function ()
      require('rc.plugins.nvim-treesitter')
    end,
    build = ':TSUpdate'
  },

  -- Fuzzy Finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      require('rc.plugins.telescope')
    end
  },

  -- File Explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function ()
      require('rc.plugins.nvim-tree')
    end
  },

  -- Color
  {
    'norcalli/nvim-colorizer.lua',
    config = function ()
      require('rc.plugins.colorizer')
    end
  },

  -- Colorscheme
  {
    'sainnhe/sonokai',
    config = function ()
      require('rc.plugins.sonokai')
    end
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    config = function ()
      require('rc.plugins.lualine')
    end
  },

  -- Tabline
  {
    'akinsho/bufferline.nvim',
    config = function ()
      require('rc.plugins.bufferline')
    end
  },

  -- Terminal
  {
    'akinsho/toggleterm.nvim',
    config = function ()
      require('rc.plugins.toggleterm')
    end
  },

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require('rc.plugins.gitsigns')
    end
  },
  {
    'akinsho/git-conflict.nvim',
    config = function ()
      require('rc.plugins.git-conflict')
    end
  },

  -- Motion
  {
    'phaazon/hop.nvim',
    config = function ()
      require('rc.plugins.hop')
    end
  },

  -- Scrolling
  { 'psliwka/vim-smoothie' },

  -- Editing Support
  {
    'windwp/nvim-autopairs',
    config = function ()
      require('rc.plugins.nvim-autopairs')
    end
  },
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
  {
    'ojroques/nvim-osc52',
    config = function ()
      require('rc.plugins.osc52')
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
  },

  -- Session
  {
    'rmagatti/auto-session',
    config = function ()
      require('rc.plugins.auto-session')
    end
  },

  -- Window
  {
    'beauwilliams/focus.nvim',
    config = function ()
      require('rc.plugins.focus')
    end
  },
  {
    'kwkarlwang/bufresize.nvim',
    config = function ()
      require('rc.plugins.bufresize')
    end
  },
  {
    'caenrique/swap-buffers.nvim',
    config = function ()
      require('rc.plugins.swap-buffers')
    end
  },
  {
    'declancm/maximize.nvim',
    config = function ()
      require('rc.plugins.maximize')
    end
  },

  -- Tmux
  {
    'aserowy/tmux.nvim',
    config = function ()
      require('rc.plugins.tmux')
    end
  },

  -- Markdown
  {
    'iamcco/markdown-preview.nvim',
    build = function ()
      vim.fn['mkdp#util#install']()
    end,
    ft = { 'markdown' }
  }
}
