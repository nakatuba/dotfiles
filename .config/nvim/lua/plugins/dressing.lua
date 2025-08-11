return {
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup {
      input = {
        title_pos = 'center',
        relative = 'editor',
        win_options = {
          winhighlight = 'NormalFloat:Normal,FloatBorder:Blue,FloatTitle:Title'
        },
        mappings = {
          i = {
            ['<Esc>'] = 'Close'
          }
        }
      }
    }
  end
}
