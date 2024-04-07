return {
  'vhyrro/luarocks.nvim',
  priority = 1000,
  opts = {
    rocks = { 'yaml' },
    luarocks_build_args = { '--with-lua=' .. vim.fn.system('asdf where lua') }
  }
}
