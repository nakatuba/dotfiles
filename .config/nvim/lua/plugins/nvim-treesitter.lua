return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
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
      }
    }
  end,
  build = ':TSUpdate'
}
