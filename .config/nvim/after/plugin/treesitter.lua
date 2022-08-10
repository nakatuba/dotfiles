if not pcall(require, 'nvim-treesitter') then return end

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'html', 'css', 'javascript', 'typescript', 'tsx', 'python', 'ruby', 'go', 'vue' },
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
    disable = { 'python', 'go' }
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true
  }
}
