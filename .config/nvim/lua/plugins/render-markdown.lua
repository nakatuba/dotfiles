return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter'
  },
  config = function()
    require('render-markdown').setup {
      heading = {
        icons = {}
      },
      sign = {
        enabled = false
      }
    }

    vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { bg = '#4f2f36' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { bg = '#4f3b2f' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { bg = '#4f472f' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { bg = '#3f4f2f' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { bg = '#2f494f' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { bg = '#372f4f' })
  end,
  ft = { 'markdown', 'Avante' }
}
