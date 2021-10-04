require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'python', 'vue' },
  highlight = {
    enable = true,
    disable = { 'vue' }
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true
  }
}
