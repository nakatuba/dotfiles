return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim'
  },
  config = function ()
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
