if !exists('g:loaded_swap') | finish | endif

nmap g<        <Plug>(swap-prev)
nmap g>        <Plug>(swap-next)
nmap <Leader>s <Plug>(swap-interactive)
omap i,        <Plug>(swap-textobject-i)
xmap i,        <Plug>(swap-textobject-i)
omap a,        <Plug>(swap-textobject-a)
xmap a,        <Plug>(swap-textobject-a)
