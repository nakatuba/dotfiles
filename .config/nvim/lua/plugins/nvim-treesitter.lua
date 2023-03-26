return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'windwp/nvim-ts-autotag',
    'JoosepAlviste/nvim-ts-context-commentstring'
  },
  config = function ()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'html', 'css', 'javascript', 'typescript', 'tsx', 'python', 'ruby', 'go', 'terraform' },
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
  end,
  build = ':TSUpdate'
}
