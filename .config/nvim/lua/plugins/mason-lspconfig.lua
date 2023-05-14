return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig'
  },
  config = function()
    require('mason-lspconfig').setup {
      ensure_installed = { 'tsserver', 'pyright', 'gopls', 'vimls', 'lua_ls', 'marksman', 'terraformls' }
    }
  end
}
