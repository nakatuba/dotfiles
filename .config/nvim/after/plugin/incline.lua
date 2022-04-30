require('incline').setup {
  render = function(props)
    local bufname = vim.api.nvim_buf_get_name(props.buf)
    return vim.fn.fnamemodify(bufname, ':.')
  end
}

require('incline').disable()

vim.api.nvim_set_keymap('n' , '<leader>i', '<cmd>lua require("incline").toggle()<CR>', { noremap = true, silent = true })
