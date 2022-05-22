require('bufferline').setup {
  options = {
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Directory',
        text_align = 'left'
      }
    }
  }
}

vim.keymap.set('n', '<C-p>', "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set('n', '<C-n>', "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set('n', '<M-p>', "<cmd>BufferLineMovePrev<CR>")
vim.keymap.set('n', '<M-n>', "<cmd>BufferLineMoveNext<CR>")
