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
      code = {
        border = 'thin',
        inline_pad = 1
      },
      sign = {
        enabled = false
      }
    }

    if vim.g.colors_name == 'sonokai' then
      vim.api.nvim_set_hl(0, '@markup.heading',             { link = 'Normal' })
      vim.api.nvim_set_hl(0, '@markup.quote',               { link = 'Normal' })
      vim.api.nvim_set_hl(0, '@markup.raw.block.markdown',  { link = 'Normal' })
      vim.api.nvim_set_hl(0, '@markup.raw.markdown_inline', { link = 'Orange' })

      vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { fg = '#fc5d7c', underline = true })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { fg = '#f39660', underline = true })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { fg = '#e7c664', underline = true })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { fg = '#9ed072', underline = true })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { fg = '#76cce0', underline = true })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { fg = '#b39df3', underline = true })
    end
  end,
  ft = { 'markdown' }
}
