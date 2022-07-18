if not pcall(require, 'substitute') then return end

vim.keymap.set('n', '<leader>s',  "<cmd>lua require('substitute').operator()<cr>")
vim.keymap.set('n', '<leader>ss', "<cmd>lua require('substitute').line()<cr>")
vim.keymap.set('n', '<leader>S',  "<cmd>lua require('substitute').eol()<cr>")
vim.keymap.set('v', '<leader>s',  "<cmd>lua require('substitute').visual()<cr>")
