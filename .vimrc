call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tomasr/molokai'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

let g:airline_powerline_fonts = 1

set number
set cursorline
set ttimeoutlen=50

colorscheme molokai

highlight Normal ctermbg=none
highlight LineNr ctermbg=none

nnoremap <silent> <Space><Space> :Files<CR>
