call plug#begin(stdpath('data') . '/plugged')

Plug 'navarasu/onedark.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'xiyaowong/nvim-transparent'
Plug 'posva/vim-vue'

call plug#end()

let g:onedark_disable_terminal_colors = 1

set number
set cursorline
set scrolloff=5
set nowrap
set hidden
set signcolumn=number
set tabstop=2
set shiftwidth=2
set expandtab
set splitbelow
set splitright
set updatetime=100
set termguicolors

autocmd BufEnter * checktime

colorscheme onedark

let mapleader = "\<Space>"

map s <C-w>
map q <Nop>
map , <Plug>(easymotion-prefix)
map _ <Plug>(operator-replace)

" Emacs key bindings
noremap! <C-f> <Right>
noremap! <C-b> <Left>
noremap! <C-p> <Up>
noremap! <C-n> <Down>
noremap! <C-a> <HOME>
noremap! <C-e> <END>
noremap! <C-d> <Del>

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

nnoremap Y y$
nnoremap <silent> <Leader>e  :NvimTreeToggle<CR>
nnoremap <silent> <Leader>f  :Files<CR>
nnoremap <silent> <Leader>rg :Rg<CR>
nnoremap <silent> <Leader>rn :Lspsaga rename<CR>
nnoremap <silent> <Leader>t  :TransparentToggle<CR>
nnoremap <silent> <C-p> :BufferLineCyclePrev<CR>
nnoremap <silent> <C-n> :BufferLineCycleNext<CR>
nnoremap <silent> <M-p> :BufferLineMovePrev<CR>
nnoremap <silent> <M-n> :BufferLineMoveNext<CR>

xnoremap <silent> <Leader>rg y:Rg <C-R>"<CR>
