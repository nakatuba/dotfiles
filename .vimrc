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
let g:NERDTreeQuitOnOpen = 1
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

set number
set cursorline
set belloff=all
set ttimeoutlen=50

colorscheme molokai

highlight Normal ctermbg=none
highlight LineNr ctermbg=none

let mapleader = "\<Space>"

nnoremap <silent> <Leader>e :NERDTreeToggle<CR>
map <Leader>/ <Plug>NERDCommenterToggle
nnoremap <silent> <Leader>p :Files<CR>
