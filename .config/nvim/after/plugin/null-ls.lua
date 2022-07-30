if not pcall(require, 'null-ls') then return end

require('null-ls').setup {
  diagnostics_format = '[#{c}] #{m} (#{s})',
  sources = {
    require('null-ls').builtins.diagnostics.eslint,
    require('null-ls').builtins.formatting.prettier,
    require('null-ls').builtins.diagnostics.flake8.with {
      extra_args = { '--ignore=E501,W503' }
    },
    require('null-ls').builtins.formatting.black,
    require('null-ls').builtins.formatting.isort
  }
}
