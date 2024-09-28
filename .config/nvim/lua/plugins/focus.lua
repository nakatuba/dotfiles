return {
  'nvim-focus/focus.nvim',
  config = function()
    require('focus').setup {
      ui = {
        signcolumn = false
      }
    }

    require('focus').focus_equalise()

    vim.keymap.set('n', '<CR>', '<cmd>FocusMaxOrEqual<CR>')

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('telescope_prompt_cursorline', { clear = true }),
      pattern = 'TelescopePrompt',
      callback = function()
        vim.opt_local.cursorline = false
      end
    })
  end
}
