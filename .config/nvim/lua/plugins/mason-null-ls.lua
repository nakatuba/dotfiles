return {
  'jay-babu/mason-null-ls.nvim',
  dependencies = {
    'mason-org/mason.nvim',
    'nvimtools/none-ls.nvim'
  },
  config = function()
    require('mason-null-ls').setup {
      ensure_installed = {
        'prettier'
      }
    }
  end
}
