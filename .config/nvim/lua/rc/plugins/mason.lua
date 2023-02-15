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
