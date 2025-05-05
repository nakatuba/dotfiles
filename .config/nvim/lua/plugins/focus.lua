return {
  'nvim-focus/focus.nvim',
  config = function()
    require('focus').setup {
      ui = {
        cursorline = false,
        signcolumn = false
      }
    }

     require('focus').focus_equalise()

     vim.keymap.set('n', '<CR>', '<cmd>FocusMaxOrEqual<CR>')
  end
}
