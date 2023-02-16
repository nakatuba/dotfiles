return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function ()
    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = {
        'tsserver',
        'pyright',
        'gopls',
        'vuels',
        'vimls',
        'lua_ls'
      }
    }
  end
}
