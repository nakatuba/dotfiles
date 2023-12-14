return {
  'hedyhli/outline.nvim',
  config = function()
    require('outline').setup {
      symbol_folding = {
        autofold_depth = false
      }
    }

    vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>')
  end
}
