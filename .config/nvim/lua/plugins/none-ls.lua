return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'davidmh/cspell.nvim'
  },
  config = function()
    local cspell_config = {
      cspell_config_dirs = {
        '~/.config/cspell',
        '~/.local/share/cspell'
      },
      on_add_to_dictionary = function(payload)
        local job = require('plenary.job')

        job:new({
          command = 'sort',
          args = { payload.dictionary_path, '-o', payload.dictionary_path },
          cwd = vim.fs.dirname(payload.cspell_config_path)
        }):start()
      end
    }

    require('null-ls').setup {
      diagnostics_format = '[#{c}] #{m} (#{s})',
      on_attach = function(client, bufnr)
        vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',                   { buffer = bufnr })
        vim.keymap.set('n', '<leader>d',  '<cmd>Telescope diagnostics<CR>',                           { buffer = bufnr })
        vim.keymap.set('n', '[d',         '<cmd>lua vim.diagnostic.goto_prev({ float = false })<CR>', { buffer = bufnr })
        vim.keymap.set('n', ']d',         '<cmd>lua vim.diagnostic.goto_next({ float = false })<CR>', { buffer = bufnr })

        if client.supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('formatting', { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.format() end
          })
        end

        vim.api.nvim_create_autocmd('CursorHold', {
          group = vim.api.nvim_create_augroup('diagnostic', { clear = true }),
          buffer = bufnr,
          callback = function() vim.diagnostic.open_float(nil, { focusable = false, scope = 'cursor' }) end
        })
      end,
      sources = {
        require('cspell').diagnostics.with {
          config = cspell_config,
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity.HINT
          end
        },
        require('cspell').code_actions.with {
          config = cspell_config
        },

        -- javascript
        require('none-ls.diagnostics.eslint'),
        require('null-ls').builtins.formatting.prettier.with {
          disabled_filetypes = { 'json', 'yaml' }
        },

        -- python
        require('none-ls.diagnostics.flake8').with {
          extra_args = { '--ignore=E203,E266,E501,W503' },
          cwd = function(params)
            return vim.fn.fnamemodify(params.bufname, ':h')
          end
        },
        require('null-ls').builtins.formatting.black.with {
          cwd = function(params)
            return vim.fn.fnamemodify(params.bufname, ':h')
          end
        },
        require('null-ls').builtins.formatting.isort.with {
          cwd = function(params)
            return vim.fn.fnamemodify(params.bufname, ':h')
          end
        }
      }
    }
  end
}
