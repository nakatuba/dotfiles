call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'akinsho/toggleterm.nvim'

call plug#end()

let g:airline_powerline_fonts = 1
let g:coc_global_extensions = ['coc-pyright']
let g:ale_linters = {'python': ['flake8']}
let g:ale_python_flake8_options="--ignore=E501,W503"
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_fix_on_save = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1

let mapleader = "\<Space>"

source ~/.config/nvim/coc.vim

set number
set cursorline
set scrolloff=5
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set splitbelow
set splitright
set updatetime=100
set termguicolors

autocmd BufEnter * checktime

colorscheme molokai

highlight Normal ctermbg=none guibg=none
highlight LineNr ctermbg=none guibg=none
highlight SignColumn ctermbg=none guibg=none

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
nnoremap <silent> <Leader>e :NERDTreeToggle<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>l :Lines<CR>
nnoremap <silent> <C-n> :BufferLineCycleNext<CR>
nnoremap <silent> <C-p> :BufferLineCyclePrev<CR>
nnoremap <silent> <C-]> :BufferLineMoveNext<CR>
nnoremap <silent> <C-[> :BufferLineMovePrev<CR>
nnoremap <silent> <C-q> :bdelete<CR>

lua << EOF
require("bufferline").setup {}
require("toggleterm").setup {
  open_mapping = [[<c-\>]],
  direction = 'tab'
}
EOF
