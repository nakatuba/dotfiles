require('nvim-treesitter.configs').setup {
  ensure_installed = { 'html', 'css', 'javascript', 'python', 'go', 'vue' },
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
    disable = { 'python', 'go' }
  },
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ['g>'] = '@parameter.inner'
      },
      swap_previous = {
        ['g<'] = '@parameter.inner'
      }
    }
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true
  }
}
