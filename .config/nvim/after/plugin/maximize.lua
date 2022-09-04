if not pcall(require, 'maximize') then return end

vim.keymap.set('n', '<CR>', "<cmd>lua require('maximize').toggle()<CR>")
