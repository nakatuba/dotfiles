if not pcall(require, 'hop') then return end

require('hop').setup()

vim.keymap.set({'n', 'v'}, '<leader>w', '<cmd>HopWord<CR>')
