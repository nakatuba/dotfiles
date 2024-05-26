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
        'json',
        'markdown',
        'markdown_inline',
        'php',
        'python',
        'ruby',
        'terraform',
        'tsx',
        'typescript',
        'vue'
      },
      highlight = {
        enable = true
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          node_incremental = '<Tab>',
          node_decremental = '<S-Tab>'
        }
      },
      indent = {
        enable = true,
        disable = { 'go', 'python', 'ruby' }
      },
      autotag = {
        enable = true
      }
    }
  end,
  build = ':TSUpdate'
}
