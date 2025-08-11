return {
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup {
      input = {
        title_pos = 'center',
        relative = 'editor',
        win_options = {
          winblend = 0,
          winhighlight = 'NormalFloat:Normal,FloatBorder:Blue,FloatTitle:Title'
        },
        mappings = {
          i = {
            ['<Esc>'] = 'Close'
          }
        }
      },
      select = {
        get_config = function(opts)
          if opts.kind == 'codeaction' then
            return {
              backend = 'builtin',
              builtin = {
                relative = 'cursor',
                win_options = {
                  winblend = 0,
                  winhighlight = 'NormalFloat:Normal,FloatBorder:Blue,FloatTitle:Title'
                },
                min_height = 0
              }
            }
          end
        end
      }
    }
  end
}
