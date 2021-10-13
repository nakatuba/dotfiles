require('toggleterm').setup {
  open_mapping = '<C-Space>',
  direction = 'float',
}

local Terminal  = require('toggleterm.terminal').Terminal

function _lazygit_toggle()
  local lazygit = Terminal:new({
    cmd = 'lazygit',
    hidden = true,
    on_open = function(term)
      vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<C-g>', '<cmd>close<CR>', { noremap = true, silent = true })
    end
  })
  lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<C-g>', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
