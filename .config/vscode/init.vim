call plug#begin()

Plug 'phaazon/hop.nvim'
Plug 'monaqa/dial.nvim'
Plug 'gbprod/substitute.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'glts/vim-textobj-comment'
Plug 'inside/vim-textobj-jsxattr'
Plug 'tommcdo/vim-exchange'
Plug 'machakann/vim-swap'

call plug#end()

let g:textobj_comment_no_default_key_mappings = 1
let g:swap_no_default_key_mappings = 1

autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | call setreg('*', getreg('"')) | endif

let mapleader = "\<Space>"

set ignorecase
set smartcase

map s <C-w>
map q <Nop>

" Emacs key bindings
noremap! <C-f> <Right>
noremap! <C-b> <Left>
noremap! <C-p> <Up>
noremap! <C-n> <Down>
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <C-d> <Del>

nnoremap u           <cmd>call VSCodeNotify('undo')<CR>
nnoremap <C-r>       <cmd>call VSCodeNotify('redo')<CR>
nnoremap gd          <cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
nnoremap gr          <cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
nnoremap K           <cmd>call VSCodeNotify('editor.action.showHover')<CR>
nnoremap <Leader>rn  <cmd>call VSCodeNotify('editor.action.rename')<CR>
nnoremap <Leader>e   <cmd>call VSCodeNotify('workbench.view.explorer')<CR>
nnoremap <Leader>f   <cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
