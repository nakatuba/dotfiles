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
        'jdtls',
        'kotlin_lsp',
        'lua_ls',
        'marksman',
        'protols',
        'pyright',
        'solargraph',
        'terraformls',
        'ts_ls',
        'vue_ls'
      }
    }
  end
}
