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
        'lua_ls',
        'marksman',
        'pyright',
        'solargraph',
        'terraformls',
        'tsserver',
        'vimls'
      }
    }
  end
}
