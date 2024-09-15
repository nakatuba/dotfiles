return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'davidmh/cspell.nvim'
  },
  config = function()
    local null_ls = require('null-ls')

    null_ls.setup {
      diagnostics_format = '[#{c}] #{m} (#{s})',
      on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            callback = function() vim.lsp.buf.format() end
          })
        end
      end,
      sources = {
        require('cspell').diagnostics.with {
          extra_args = { '--config', '~/.config/cspell/cspell.json' },
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity.HINT
          end
        },
        require('cspell').code_actions,

        -- javascript
        require('none-ls.diagnostics.eslint'),
        null_ls.builtins.formatting.prettier.with {
          disabled_filetypes = { 'json', 'yaml' }
        },

        -- python
        require('none-ls.diagnostics.flake8').with {
          extra_args = { '--ignore=E203,E266,E501,W503' },
          cwd = function(params)
            return vim.fn.fnamemodify(params.bufname, ':h')
          end
        },
        null_ls.builtins.formatting.black.with {
          cwd = function(params)
            return vim.fn.fnamemodify(params.bufname, ':h')
          end
        },
        null_ls.builtins.formatting.isort.with {
          cwd = function(params)
            return vim.fn.fnamemodify(params.bufname, ':h')
          end
        }
      }
    }
  end
}
