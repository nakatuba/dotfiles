vim.api.nvim_create_autocmd('FocusGained', {
  callback = function()
    vim.cmd.checktime()
  end
})

vim.api.nvim_create_autocmd('ExitPre', {
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.bo[buf].buftype == 'terminal' then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end
})
