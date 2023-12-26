return {
  'jose-elias-alvarez/null-ls.nvim',
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
        -- javascript
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.prettier,

        -- php
        null_ls.builtins.diagnostics.phpcs.with {
          extra_args = { '--standard=PSR12' }
        },
        null_ls.builtins.formatting.phpcbf.with {
          extra_args = { '--standard=PSR12' }
        },

        -- python
        null_ls.builtins.diagnostics.flake8.with {
          extra_args = { '--ignore=E203, E266, E501, W503' },
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
