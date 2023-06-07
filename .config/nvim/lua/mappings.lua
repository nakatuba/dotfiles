vim.g.mapleader = ' '

vim.keymap.set('', 'j', 'gj',    { remap = true })
vim.keymap.set('', 'k', 'gk',    { remap = true })
vim.keymap.set('', 'q', '<Nop>', { remap = true })
vim.keymap.set('', 's', '<C-w>', { remap = true })

-- Emacs key bindings
vim.keymap.set('!', '<C-f>', '<Right>')
vim.keymap.set('!', '<C-b>', '<Left>')
vim.keymap.set('!', '<C-p>', '<Up>')
vim.keymap.set('!', '<C-n>', '<Down>')
vim.keymap.set('!', '<C-a>', '<Home>')
vim.keymap.set('!', '<C-e>', '<End>')
vim.keymap.set('!', '<C-d>', '<Del>')
