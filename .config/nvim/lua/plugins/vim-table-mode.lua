return {
  'dhruvasagar/vim-table-mode',
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      command = 'TableModeEnable'
    })
  end,
  ft = { 'markdown' }
}
