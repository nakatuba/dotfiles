if not pcall(require, 'substitute') then return end

vim.keymap.set('n', 'gs',  "<cmd>lua require('substitute').operator()<CR>")
vim.keymap.set('n', 'gss', "<cmd>lua require('substitute').line()<CR>")
vim.keymap.set('n', 'gS',  "<cmd>lua require('substitute').eol()<CR>")
vim.keymap.set('v', 'gs',  "<cmd>lua require('substitute').visual()<CR>")
