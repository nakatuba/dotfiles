return {
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup {
      input = {
        win_options = {
          winblend = 0,
          winhighlight = 'NormalFloat:Normal,FloatBorder:Blue'
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
                  winhighlight = 'NormalFloat:Normal,FloatBorder:Blue'
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
