return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter').install {
      'css',
      'go',
      'html',
      'java',
      'javascript',
      'kotlin',
      'php',
      'proto',
      'python',
      'ruby',
      'terraform',
      'tsx',
      'typescript',
      'vue'
    }

    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start)
      end
    })
  end,
  build = ':TSUpdate'
}
