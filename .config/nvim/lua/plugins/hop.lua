return {
  'phaazon/hop.nvim',
  config = function()
    require('hop').setup()

    vim.keymap.set('', '<leader>w', '<cmd>HopWord<CR>')
  end
}
