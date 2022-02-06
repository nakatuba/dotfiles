call plug#begin(stdpath('data') . '/plugged')

Plug 'navarasu/onedark.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'tami5/lspsaga.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'

call plug#end()

set number
set cursorline
set scrolloff=5
set nowrap
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

autocmd BufEnter * checktime

let mapleader = "\<Space>"

map s <C-w>
map q <Nop>
map _ <Plug>(operator-replace)

" Emacs key bindings
noremap! <C-f> <Right>
noremap! <C-b> <Left>
noremap! <C-p> <Up>
noremap! <C-n> <Down>
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <C-d> <Del>

nnoremap <silent> <Leader>e  :NvimTreeToggle<CR>
nnoremap <silent> <Leader>f  :Telescope find_files<CR>
nnoremap <silent> <Leader>g  :Telescope live_grep<CR>
nnoremap <silent> <Leader>d  :Telescope diagnostics<CR>
nnoremap <silent> <C-g><C-f> :Telescope git_status<CR>
nnoremap <silent> <C-p>      :BufferLineCyclePrev<CR>
nnoremap <silent> <C-n>      :BufferLineCycleNext<CR>
nnoremap <silent> <M-p>      :BufferLineMovePrev<CR>
nnoremap <silent> <M-n>      :BufferLineMoveNext<CR>

vnoremap <silent> <Leader>f  y:Telescope find_files default_text=<C-r>"<CR>
vnoremap <silent> <Leader>g  y:Telescope live_grep  default_text=<C-r>"<CR>
