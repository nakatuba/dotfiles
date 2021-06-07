call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tomasr/molokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()

let g:airline_powerline_fonts = 1
let g:coc_config_home = '~/.vim'
let g:coc_global_extensions = ['coc-pyright']
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_fix_on_save = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

set number
set cursorline
set shiftwidth=4
set tabstop=4
set expandtab
set belloff=all
set ttimeoutlen=50

colorscheme molokai

highlight Normal ctermbg=none
highlight LineNr ctermbg=none
highlight SignColumn ctermbg=none

let mapleader = "\<Space>"

" Emacs key bindings
map! <C-f> <Right>
map! <C-b> <Left>
map! <C-p> <Up>
map! <C-n> <Down>
map! <C-a> <HOME>
map! <C-e> <END>
map! <C-d> <Del>

if has('nvim')
  inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
endif
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap <silent> <Leader>e :NERDTreeToggle<CR>
map cc <Plug>NERDCommenterToggle
nnoremap <silent> <Leader>p :Files<CR>
