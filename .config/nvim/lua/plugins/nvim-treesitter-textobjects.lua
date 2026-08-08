return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  dependencies = {
    'nvim-treesitter/nvim-treesitter'
  },
  config = function()
    require('nvim-treesitter-textobjects').setup {
      select = {
        lookahead = true
      }
    }

    vim.keymap.set({'o', 'x'}, 'af', function()
      require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
    end)
    vim.keymap.set({'o', 'x'}, 'if', function()
      require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
    end)
  end
}
