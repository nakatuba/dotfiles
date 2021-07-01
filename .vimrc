call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tomasr/molokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'troydm/zoomwintab.vim'
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()

let g:airline_powerline_fonts = 1
let g:coc_config_home = '~/.vim'
let g:coc_global_extensions = ['coc-pyright']
let g:ale_linters = {'python': ['flake8']}
let g:ale_python_flake8_options="--ignore=E501,W503"
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_fix_on_save = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:neoterm_default_mod = 'botright'
let g:neoterm_autoinsert = 1

let mapleader = "\<Space>"

source ~/.vim/coc.vim

set number
set cursorline
set nowrap
set shiftwidth=4
set tabstop=4
set expandtab
set splitbelow
set splitright
set belloff=all
set updatetime=100
set ttimeoutlen=50

colorscheme molokai

highlight Normal ctermbg=none
highlight LineNr ctermbg=none
highlight SignColumn ctermbg=none

map s <C-w>
map q <Nop>

" Emacs key bindings
noremap! <C-f> <Right>
noremap! <C-b> <Left>
noremap! <C-p> <Up>
noremap! <C-n> <Down>
noremap! <C-a> <HOME>
noremap! <C-e> <END>
noremap! <C-d> <Del>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap <silent> <Leader>e :NERDTreeToggle<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>h :History<CR>
nnoremap <silent> <C-s> :Ttoggle<CR>
tnoremap <silent> <C-s> <C-\><C-n>:Ttoggle<CR>
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
