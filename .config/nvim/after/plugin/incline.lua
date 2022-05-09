require('incline').setup {
  render = function(props)
    local bufname = vim.api.nvim_buf_get_name(props.buf)
    return vim.fn.fnamemodify(bufname, ':.')
  end
}
