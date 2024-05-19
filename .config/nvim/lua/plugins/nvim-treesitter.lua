return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'windwp/nvim-ts-autotag'
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
