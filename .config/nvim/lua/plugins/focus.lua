return {
  'nvim-focus/focus.nvim',
  config = function()
    require('focus').setup {
      autoresize = {
        enable = false
      },
      ui = {
        signcolumn = false
      }
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'TelescopePrompt',
      callback = function()
        vim.opt_local.cursorline = false
      end
    })
  end
}
