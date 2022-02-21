require('null-ls').setup {
  diagnostics_format = '[#{c}] #{m} (#{s})',
  sources = {
    -- python
    require('null-ls').builtins.diagnostics.flake8.with {
      extra_args = { '--ignore=E501,W503' }
    },
    require('null-ls').builtins.formatting.black,
    require('null-ls').builtins.formatting.isort,
    -- go
    require('null-ls').builtins.diagnostics.golangci_lint.with {
      diagnostics_format = '#{m} (#{s})'
    }
  }
}
