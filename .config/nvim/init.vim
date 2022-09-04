call plug#begin()

Plug 'sainnhe/sonokai'
Plug 'nvim-lualine/lualine.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'folke/trouble.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'phaazon/hop.nvim'
Plug 'monaqa/dial.nvim'
Plug 'b0o/incline.nvim'
Plug 'gbprod/substitute.nvim'
Plug 'kwkarlwang/bufresize.nvim'
Plug 'caenrique/swap-buffers.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'rmagatti/auto-session'
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'glts/vim-textobj-comment'
Plug 'inside/vim-textobj-jsxattr'
Plug 'psliwka/vim-smoothie'
Plug 'tommcdo/vim-exchange'
Plug 'ojroques/vim-oscyank'
Plug 'machakann/vim-swap'

call plug#end()

let g:sonokai_transparent_background = 1
let g:sonokai_diagnostic_virtual_text = 'colored'
let g:sonokai_disable_terminal_colors = 1
let g:textobj_comment_no_default_key_mappings = 1
let g:swap_no_default_key_mappings = 1
let g:oscyank_term = 'default'

set number
set cursorline
set scrolloff=5
set nowrap
set noswapfile
set mouse=a
set signcolumn=yes
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set splitbelow
set splitright
set updatetime=100
set termguicolors

colorscheme sonokai

highlight VertSplit guifg=#e2e2e3

autocmd BufEnter * checktime
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif

let mapleader = "\<Space>"

map s <C-w>
map q <Nop>

" Emacs key bindings
noremap! <C-f> <Right>
noremap! <C-b> <Left>
noremap! <C-p> <Up>
noremap! <C-n> <Down>
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <C-d> <Del>
