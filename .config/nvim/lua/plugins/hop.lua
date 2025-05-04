return {
  'smoka7/hop.nvim',
  config = function()
    require('hop').setup()

    vim.keymap.set({'n', 'x'}, '<leader>w', '<cmd>HopWordMW<CR>')
  end
}
