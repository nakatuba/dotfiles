return {
  'jay-babu/mason-null-ls.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'jose-elias-alvarez/null-ls.nvim'
  },
  config = function()
    require('mason-null-ls').setup {
      ensure_installed = { 'prettier' }
    }
  end
}
