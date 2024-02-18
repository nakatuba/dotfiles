return {
  'nakatuba/notes.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim'
  },
  config = function()
    if not pcall(require, 'notes') then
      return
    end

    require('notes').setup {
      dir = '~/ghq/github.com/nakatuba/notes'
    }

    vim.keymap.set('n', '<leader>nn', require('notes').new)
    vim.keymap.set('n', '<leader>no', require('notes').open)
  end
}
