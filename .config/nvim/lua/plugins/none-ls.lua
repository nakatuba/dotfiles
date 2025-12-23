return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim'
  },
  config = function()
    require('null-ls').setup {
      diagnostics_format = '[#{c}] #{m} (#{s})',
      sources = {
        -- javascript
        require('none-ls.diagnostics.eslint'),
        require('null-ls').builtins.formatting.prettier,

        -- markdown
        require('null-ls').builtins.diagnostics.textlint.with {
          extra_filetypes = { 'org' },
          only_local = 'node_modules/.bin'
        },
        require('null-ls').builtins.formatting.textlint.with {
          extra_filetypes = { 'org' },
          only_local = 'node_modules/.bin'
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
