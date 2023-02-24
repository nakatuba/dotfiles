return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim'
  },
  config = function ()
    require('mason-lspconfig').setup {
      ensure_installed = { 'tsserver', 'pyright', 'gopls', 'vimls', 'lua_ls' }
    }
  end
}
