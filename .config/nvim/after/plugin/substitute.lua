if not pcall(require, 'substitute') then return end

vim.keymap.set('n', 'gs',  "<cmd>lua require('substitute').operator()<cr>")
vim.keymap.set('n', 'gss', "<cmd>lua require('substitute').line()<cr>")
vim.keymap.set('n', 'gS',  "<cmd>lua require('substitute').eol()<cr>")
vim.keymap.set('v', 'gs',  "<cmd>lua require('substitute').visual()<cr>")
