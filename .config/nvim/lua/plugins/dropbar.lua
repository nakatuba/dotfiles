return {
  'Bekaboo/dropbar.nvim',
  config = function()
    require('dropbar').setup {
      bar = {
        enable = function(buf)
          return vim.fn.bufname(buf) ~= '' and vim.bo[buf].buftype == ''
        end,
        sources = {
          require('dropbar.sources').path
        }
      },
      icons = {
        kinds = {
          dir_icon = ''
        },
        ui = {
          bar = {
            separator = '   '
          }
        }
      },
      sources = {
        path = {
          modified = function(sym)
            return sym:merge({
              icon = '● ',
              icon_hl = 'String'
            })
          end
        }
      }
    }

    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        vim.api.nvim_set_hl(0, 'WinBarNC', { link = 'WinBar' })
      end
    })
  end
}
