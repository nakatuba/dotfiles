vim.api.nvim_create_autocmd('FocusGained', {
  group = vim.api.nvim_create_augroup('checktime', { clear = true }),
  callback = function()
    vim.cmd.checktime()
  end
})
