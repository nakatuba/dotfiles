local null_ls = require('null-ls')

null_ls.setup {
  diagnostics_format = '[#{c}] #{m} (#{s})',
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier,
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
