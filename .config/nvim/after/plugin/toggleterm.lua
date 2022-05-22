require('toggleterm').setup {
  size = function(term)
    if term.direction == 'horizontal' then
      return vim.o.lines * 0.5
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.5
    end
  end,
  persist_size = false,
}

vim.keymap.set('n', '<C-Space>', function()
  local direction = vim.o.columns < vim.o.lines * 2 and 'horizontal' or 'vertical'
  vim.api.nvim_command('ToggleTerm direction=' .. direction)
end)

vim.keymap.set('t', '<C-Space>', '<cmd>ToggleTerm<CR>')
