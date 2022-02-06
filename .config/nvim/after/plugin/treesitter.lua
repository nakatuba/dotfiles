require('nvim-treesitter.configs').setup {
  ensure_installed = { 'python', 'html', 'css', 'javascript', 'vue' },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['a,'] = '@parameter.outer',
        ['i,'] = '@parameter.inner'
      }
    },
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
