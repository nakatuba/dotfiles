return {
  'iamcco/markdown-preview.nvim',
  init = function()
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_combine_preview = 1
  end,
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
