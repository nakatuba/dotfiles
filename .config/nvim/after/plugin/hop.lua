if not pcall(require, 'hop') then return end

require('hop').setup()

vim.keymap.set('', '<leader>w', '<cmd>HopWord<CR>')
