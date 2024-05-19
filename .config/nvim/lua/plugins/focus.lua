return {
  'nvim-focus/focus.nvim',
  config = function()
    require('focus').setup {
      autoresize = false,
      signcolumn = false
    }

    vim.keymap.set('n', '<CR>', '<cmd>FocusMaxOrEqual<CR>')
  end,
  commit = '3d9df42'
}
