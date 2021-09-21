call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()

let g:airline_powerline_fonts = 1
let g:coc_global_extensions = ['coc-pyright']
let g:ale_linters = {'python': ['flake8']}
let g:ale_python_flake8_options="--ignore=E501,W503"
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_fix_on_save = 1

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

highlight Normal          guibg=none
highlight LineNr          guibg=none
highlight SignColumn      guibg=none
highlight GitGutterAdd    guifg=#009900
highlight GitGutterChange guifg=#bbbb00
highlight GitGutterDelete guifg=#ff2222

map s <C-w>
map q <Nop>
map , <Plug>(easymotion-prefix)

" Emacs key bindings
noremap! <C-f> <Right>
noremap! <C-b> <Left>
noremap! <C-p> <Up>
noremap! <C-n> <Down>
noremap! <C-a> <HOME>
noremap! <C-e> <END>
noremap! <C-d> <Del>

nmap [d  <Plug>(ale_previous_wrap)
nmap ]d  <Plug>(ale_next_wrap)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

nnoremap Y y$
nnoremap <silent> <Leader>e :NvimTreeToggle<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>l :Lines<CR>
nnoremap <silent> <C-p> :BufferLineCyclePrev<CR>
nnoremap <silent> <C-n> :BufferLineCycleNext<CR>
nnoremap <silent> <M-p> :BufferLineMovePrev<CR>
nnoremap <silent> <M-n> :BufferLineMoveNext<CR>

lua << EOF
require("bufferline").setup {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    }
  }
}
require("toggleterm").setup {
  open_mapping = "<C-Space>",
  direction = "float"
}
require("nvim-autopairs").setup {}
EOF
