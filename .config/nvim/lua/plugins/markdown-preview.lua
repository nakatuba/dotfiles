return {
  'iamcco/markdown-preview.nvim',
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreview<CR>', { buffer = true })
      end
    })
  end,
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  ft = { 'markdown' }
}
