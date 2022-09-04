if not pcall(require, 'incline') then return end

require('incline').setup {
  render = function(props)
    local bufname = vim.api.nvim_buf_get_name(props.buf)
    local res = vim.fn.fnamemodify(bufname, ':.')
    if vim.api.nvim_buf_get_option(props.buf, 'modified') then
      res = res .. ' [+]'
    end
    if vim.t.maximized then
      res = ' ' .. res
    end
    return res
  end
}

vim.keymap.set('n', '<leader>i',  "<cmd>lua require('incline').toggle()<CR>")
