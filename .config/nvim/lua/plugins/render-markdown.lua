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
      local config = vim.fn['sonokai#get_configuration']()
      local palette = vim.fn['sonokai#get_palette'](config.style, config.colors_override)

      vim.api.nvim_set_hl(0, '@markup.heading',             { fg = palette.fg[1] })
      vim.api.nvim_set_hl(0, '@markup.quote',               { fg = palette.fg[1] })
      vim.api.nvim_set_hl(0, '@markup.raw.block.markdown',  { fg = palette.fg[1] })
      vim.api.nvim_set_hl(0, '@markup.raw.markdown_inline', { fg = palette.orange[1] })

      vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { fg = palette.red[1],    underline = true })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { fg = palette.orange[1], underline = true })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { fg = palette.yellow[1], underline = true })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { fg = palette.green[1],  underline = true })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { fg = palette.blue[1],   underline = true })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { fg = palette.purple[1], underline = true })
    end
  end,
  ft = { 'markdown' }
}
