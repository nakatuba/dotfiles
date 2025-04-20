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
        'jsonls',
        'kotlin_language_server',
        'lua_ls',
        'marksman',
        'pyright',
        'solargraph',
        'terraformls',
        'ts_ls',
        'typos_lsp',
        'vuels'
      }
    }
  end
}
