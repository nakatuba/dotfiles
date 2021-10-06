require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'python', 'html', 'vue' },
  highlight = {
    enable = true,
    disable = { 'html', 'vue' }
  },
  indent = {
    enable = true,
    disable = { 'python' }
  },
  autotag = {
    enable = true
  }
}
