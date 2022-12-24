if not pcall(require, 'aerial') then return end

require('aerial').setup {
  on_attach = function(bufnr)
    vim.keymap.set('n', '<C-k>', '<cmd>AerialPrev<CR>', { buffer = bufnr })
    vim.keymap.set('n', '<C-j>', '<cmd>AerialNext<CR>', { buffer = bufnr })
  end
}

if not pcall(require, 'telescope') then return end

require('telescope').load_extension('aerial')

vim.keymap.set('n', '<leader>s', '<cmd>Telescope aerial<CR>')
