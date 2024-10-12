return {
  'hrsh7th/nvim-pasta',
  config = function()
    vim.keymap.set({'n', 'x'}, 'p', require('pasta.mapping').p)
    vim.keymap.set({'n', 'x'}, 'P', require('pasta.mapping').P)

    require('pasta').config.indent_fix = false
  end
}
