return {
  'smoka7/hop.nvim',
  config = function()
    require('hop').setup()

    vim.keymap.set('', '<leader>w', '<cmd>HopWordMW<CR>')
  end
}
