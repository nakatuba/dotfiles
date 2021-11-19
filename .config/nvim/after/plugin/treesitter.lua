require('nvim-treesitter.configs').setup {
  ensure_installed = { 'python', 'html', 'css', 'javascript', 'vue' },
  highlight = {
    enable = true
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true
  }
}
