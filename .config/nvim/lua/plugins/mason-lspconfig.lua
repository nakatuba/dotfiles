return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    'mason-org/mason.nvim',
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
        'ts_ls',
        'vuels'
      }
    }
  end
}
