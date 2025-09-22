return {
  'folke/snacks.nvim',
  config = function()
    require('snacks').setup {
      image = {
        enabled = true
      },
      input = {
        win = {
          row = function()
            return math.floor((vim.o.lines - 3) / 2)
          end,
          bo = {
            buftype = 'nofile'
          },
          keys = {
            i_esc = { '<Esc>', 'cancel', mode = 'i' }
          }
        }
      },
      picker = {
        sources = {
          files = {
            hidden = true,
            follow = true
          },
          grep = {
            hidden = true,
            follow = true
          },
          lsp_declarations = {
            jump = {
              reuse_win = false
            }
          },
          lsp_definitions = {
            jump = {
              reuse_win = false
            }
          },
          lsp_implementations = {
            jump = {
              reuse_win = false
            }
          },
          lsp_references = {
            jump = {
              reuse_win = false
            }
          },
          lsp_type_definitions = {
            jump = {
              reuse_win = false
            }
          }
        },
        layouts = {
          vertical = {
            layout = {
              width = 0.8
            }
          }
        },
        formatters = {
          file = {
            truncate = 100
          }
        },
        toggles = {
          follow = false,
          hidden = false,
          ignored = false,
          modified = false,
          regex = false
        },
        win = {
          input = {
            keys = {
              ['<C-a>'] = false,
              ['<C-b>'] = false,
              ['<C-d>'] = false,
              ['<C-f>'] = false,
              ['<M-v>'] = { 'preview_scroll_up', mode = 'i' },
              ['<C-v>'] = { 'preview_scroll_down', mode = 'i' },
              ['<C-u>'] = false,
              ['<C-/>'] = { 'toggle_layout', mode = 'i' },
              ['<C-_>'] = { 'toggle_layout', mode = 'i' },
              ['<Esc>'] = { 'close', mode = 'i' }
            }
          }
        },
        actions = {
          toggle_layout = function(picker)
            local preset = picker.resolved_layout.preset
            if type(preset) == 'function' then
              preset = preset(picker.opts.source)
            end
            picker:set_layout(preset == 'default' and 'vertical' or 'default')
          end
        }
      },
      terminal = {
        win = {
          wo = {
            winbar = '',
            winhighlight = 'NormalFloat:Normal'
          },
          on_win = function()
            vim.cmd.wincmd('=')
          end
        }
      }
    }

    vim.keymap.set('n', '<leader>f',  function() require('snacks').picker.files() end)
    vim.keymap.set('n', '<leader>g',  function() require('snacks').picker.grep() end)
    vim.keymap.set('n', '<leader>b',  function() require('snacks').picker.buffers() end)
    vim.keymap.set('n', '<leader>h',  function() require('snacks').picker.recent() end)
    vim.keymap.set('n', '<C-g><C-f>', function() require('snacks').picker.git_status() end)
    vim.keymap.set('n', '<C-g><C-b>', function() require('snacks').picker.git_branches() end)
    vim.keymap.set('n', '<C-g><C-h>', function() require('snacks').picker.git_log_file() end)

    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        vim.api.nvim_set_hl(0, 'SnacksPickerDir', { link = 'SnacksPicker' })
      end
    })
  end
}
