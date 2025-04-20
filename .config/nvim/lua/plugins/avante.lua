return {
  'yetone/avante.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim'
  },
  config = function()
    require('avante').setup {
      behaviour = {
        auto_apply_diff_after_generation = true
      }
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'Avante',
      callback = function()
        vim.api.nvim_set_hl(0, 'AvanteSidebarNormal', { link = 'Normal' })
        vim.api.nvim_set_hl(0, 'AvanteSidebarWinSeparator', { link = 'WinSeparator' })
      end
    })
  end,
  build = 'make'
}
