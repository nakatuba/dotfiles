require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'html',
    'css',
    'javascript',
    'typescript',
    'tsx',
    'python',
    'ruby',
    'go',
    'vue',
    'markdown',
    'markdown_inline'
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
    disable = { 'python', 'ruby', 'go' }
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true
  }
}