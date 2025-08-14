return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'JoosepAlviste/nvim-ts-context-commentstring'
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'css',
        'go',
        'html',
        'javascript',
        'kotlin',
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
          init_selection = false,
          node_incremental = '<Tab>',
          scope_incremental = false,
          node_decremental = '<S-Tab>'
        }
      },
      indent = {
        enable = true,
        disable = { 'go', 'python', 'ruby' }
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner'
          }
        }
      }
    }
  end,
  build = ':TSUpdate'
}
