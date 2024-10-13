return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim'
  },
  config = function()
    require('null-ls').setup {
      diagnostics_format = '[#{c}] #{m} (#{s})',
      on_attach = function(client, bufnr)
        vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',                   { buffer = bufnr })
        vim.keymap.set('n', '<leader>d',  '<cmd>Telescope diagnostics<CR>',                           { buffer = bufnr })
        vim.keymap.set('n', '[d',         '<cmd>lua vim.diagnostic.goto_prev({ float = false })<CR>', { buffer = bufnr })
        vim.keymap.set('n', ']d',         '<cmd>lua vim.diagnostic.goto_next({ float = false })<CR>', { buffer = bufnr })

        if client.supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            callback = function() vim.lsp.buf.format() end
          })
        end

        vim.api.nvim_create_autocmd('CursorHold', {
          buffer = bufnr,
          callback = function() vim.diagnostic.open_float(nil, { focusable = false, scope = 'cursor' }) end
        })
      end,
      sources = {
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
