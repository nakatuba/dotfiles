return {
  'akinsho/bufferline.nvim',
  config = function()
    require('bufferline').setup {
      options = {
        indicator = {
          style = 'none'
        },
        diagnostics = 'nvim_lsp',
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory',
            separator = true
          },
          {
            filetype = 'aerial',
            text = 'Outline',
            highlight = 'Directory',
            separator = true
          }
        }
      }
    }

    vim.keymap.set('n', '<C-p>', '<cmd>BufferLineCyclePrev<CR>')
    vim.keymap.set('n', '<C-n>', '<cmd>BufferLineCycleNext<CR>')
    vim.keymap.set('n', '<M-p>', '<cmd>BufferLineMovePrev<CR>')
    vim.keymap.set('n', '<M-n>', '<cmd>BufferLineMoveNext<CR>')
  end
}
