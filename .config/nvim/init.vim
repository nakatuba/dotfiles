call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'kassio/neoterm'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'pmalek/toogle-maximize.vim'
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:coc_global_extensions = ['coc-pyright']
let g:ale_linters = {'python': ['flake8']}
let g:ale_python_flake8_options="--ignore=E501,W503"
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_fix_on_save = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:neoterm_size = 50
let g:neoterm_autoinsert = 1
let g:neoterm_default_mod = 'botright'

let mapleader = "\<Space>"

source ~/.config/nvim/coc.vim

set number
set cursorline
set scrolloff=5
set nowrap
set cmdheight=1
set tabstop=2
set shiftwidth=2
set expandtab
set splitbelow
set splitright
set updatetime=100

autocmd BufEnter * checktime

colorscheme onedark

highlight Normal ctermbg=none

map s <C-w>
map q <Nop>
map , <Plug>(easymotion-prefix)
map _ <Plug>(operator-replace)
map <silent> <C-w>m :call ToggleMaximizeCurrentWindow()<CR>

" Emacs key bindings
noremap! <C-f> <Right>
noremap! <C-b> <Left>
noremap! <C-p> <Up>
noremap! <C-n> <Down>
noremap! <C-a> <HOME>
noremap! <C-e> <END>
noremap! <C-d> <Del>

nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
nmap [w <Plug>(ale_previous_wrap)
nmap ]w <Plug>(ale_next_wrap)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

nnoremap Y y$
nnoremap <silent> <Leader>e :NERDTreeToggle<CR>
nnoremap <silent> <Leader>u :UndotreeToggle<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>g :GFiles?<CR>
nnoremap <silent> <Leader>h :History<CR>
nnoremap <silent> <C-s> :Ttoggle<CR>
tnoremap <silent> <C-s> <C-\><C-n>:Ttoggle<CR>
