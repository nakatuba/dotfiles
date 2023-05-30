return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'windwp/nvim-ts-autotag',
    'JoosepAlviste/nvim-ts-context-commentstring'
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'css',
        'go',
        'html',
        'javascript',
        'markdown',
        'markdown_inline',
        'python',
        'ruby',
        'terraform',
        'tsx',
        'typescript'
      },
      highlight = {
        enable = true
      },
      indent = {
        enable = true,
        disable = { 'go', 'python', 'ruby' }
      },
      autotag = {
        enable = true
      },
      context_commentstring = {
        enable = true
      }
    }
  end,
  build = ':TSUpdate'
}
