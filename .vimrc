call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tomasr/molokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

let g:airline_powerline_fonts = 1
let g:coc_global_extensions = ['coc-pairs', 'coc-pyright']
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

let mapleader = "\<Space>"

" Emacs key bindings
map! <C-f> <Right>
map! <C-b> <Left>
map! <C-p> <Up>
map! <C-n> <Down>
map! <C-a> <HOME>
map! <C-e> <END>

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent> <Leader>e :NERDTreeToggle<CR>
map <Leader>/ <Plug>NERDCommenterToggle
nnoremap <silent> <Leader>p :Files<CR>
