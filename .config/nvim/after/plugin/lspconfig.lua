local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>',      opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  vim.api.nvim_command [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.signature_help()]]
  vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

  require('lspsaga').init_lsp_saga {
    rename_action_keys = {
      quit = '<Esc>'
    }
  }

  buf_set_keymap('n', '<leader>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>",                       opts)
  buf_set_keymap('n', '[e',         "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>", opts)
  buf_set_keymap('n', ']e',         "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>", opts)
end

nvim_lsp.pyright.setup {
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        autoImportCompletions = false,
        useLibraryCodeForTypes = false
      }
    }
  },
  before_init = function(_, config)
    config.settings.python.pythonPath = nvim_lsp.util.path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end
}

nvim_lsp.vuels.setup {
  on_attach = on_attach,
  settings = {
    vetur = {
      ignoreProjectWarning = true
    }
  }
}

nvim_lsp.diagnosticls.setup {
  filetypes = { 'python' },
  init_options = {
    linters = {
      flake8 = {
        command = 'flake8',
        debounce = 100,
        args = { '--format=%(row)d,%(col)d,%(code).1s,%(code)s: %(text)s', '--ignore=E501,W503', '-' },
        offsetLine = 0,
        offsetColumn = 0,
        sourceName = 'flake8',
        formatLines = 1,
        formatPattern = {
          '(\\d+),(\\d+),([A-Z]),(.*)(\\r|\\n)*$',
          {
            line = 1,
            column = 2,
            security = 3,
            message = 4
          }
        },
        securities = {
          W = 'warning',
          E = 'error',
          F = 'error',
          C = 'error',
          N = 'error'
        }
      }
    },
    filetypes = {
      python = 'flake8'
    },
    formatters = {
      black = {
        command = 'black',
        args = { '--quiet', '-' }
      },
      isort = {
        command = 'isort',
        args = { '--quiet', '-' }
      }
    },
    formatFiletypes = {
      python = { 'black', 'isort' }
    }
  }
}
