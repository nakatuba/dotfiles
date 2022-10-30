if not pcall(require, 'hop') then return end

require('hop').setup()

vim.keymap.set('n', '<leader>w', '<cmd>HopWord<CR>')
