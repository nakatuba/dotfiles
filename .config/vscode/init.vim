call plug#begin(stdpath('data') . '/plugged')

Plug 'phaazon/hop.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'

call plug#end()

autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | call setreg('*', getreg('"')) | endif

let mapleader = "\<Space>"

map s <C-w>
map q <Nop>
map _ <Plug>(operator-replace)

nnoremap gd <cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
nnoremap gr <cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
nnoremap K  <cmd>call VSCodeNotify('editor.action.showHover')<CR>
