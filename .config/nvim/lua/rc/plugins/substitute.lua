require('substitute').setup()

vim.keymap.set('n', 'gs',  "<cmd>lua require('substitute').operator()<CR>")
vim.keymap.set('n', 'gss', "<cmd>lua require('substitute').line()<CR>")
vim.keymap.set('n', 'gS',  "<cmd>lua require('substitute').eol()<CR>")
vim.keymap.set('x', 'gs',  "<cmd>lua require('substitute').visual()<CR>")

vim.keymap.set('n', 'cx',  "<cmd>lua require('substitute.exchange').operator()<CR>")
vim.keymap.set('n', 'cxx', "<cmd>lua require('substitute.exchange').line()<CR>")
vim.keymap.set('x', 'X',   "<cmd>lua require('substitute.exchange').visual()<CR>")
vim.keymap.set('n', 'cxc', "<cmd>lua require('substitute.exchange').cancel()<CR>")
