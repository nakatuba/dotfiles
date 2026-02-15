return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    'mason-org/mason.nvim',
    'neovim/nvim-lspconfig'
  },
  config = function()
    require('mason-lspconfig').setup {
      ensure_installed = {
        'buf_ls',
        'gopls',
        'intelephense',
        'kotlin_lsp',
        'lua_ls',
        'marksman',
        'pyright',
        'solargraph',
        'terraformls',
        'ts_ls',
        'vue_ls'
      }
    }
  end
}
