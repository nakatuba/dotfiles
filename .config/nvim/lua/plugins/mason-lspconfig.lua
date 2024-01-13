return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig'
  },
  config = function()
    require('mason-lspconfig').setup {
      ensure_installed = {
        'gopls',
        'intelephense',
        'lua_ls',
        'marksman',
        'pyright',
        'solargraph',
        'terraformls',
        'tsserver'
      }
    }
  end
}
