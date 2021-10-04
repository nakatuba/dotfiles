require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'python', 'vue' },
  highlight = {
    enable = true,
    disable = { 'vue' }
  },
  autotag = {
    enable = true
  }
}
