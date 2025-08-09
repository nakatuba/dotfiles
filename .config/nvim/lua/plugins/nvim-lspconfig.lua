return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { focusable = false })

    local on_attach = function(client, bufnr)
      vim.keymap.set('n', 'gd',         '<cmd>Telescope lsp_definitions<CR>',                       { buffer = bufnr })
      vim.keymap.set('n', 'gi',         '<cmd>Telescope lsp_implementations<CR>',                   { buffer = bufnr })
      vim.keymap.set('n', 'gr',         '<cmd>Telescope lsp_references<CR>',                        { buffer = bufnr, nowait = true })
      vim.keymap.set('n', 'K',          '<cmd>lua vim.lsp.buf.hover()<CR>',                         { buffer = bufnr })
      vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',                        { buffer = bufnr })
      vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',                   { buffer = bufnr })
      vim.keymap.set('n', '<leader>s',  '<cmd>Telescope lsp_document_symbols<CR>',                  { buffer = bufnr })
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
    end

    require('lspconfig').gopls.setup {
      on_attach = on_attach,
      settings = {
        gopls = {
          analyses = {
            staticcheck = true
          }
        }
      }
    }

    require('lspconfig').intelephense.setup {
      on_attach = on_attach,
      init_options = {
        globalStoragePath = vim.fn.expand('~/.local/share/intelephense'),
        licenceKey = vim.fn.expand('~/.config/intelephense/licence.txt')
      }
    }

    require('lspconfig').jsonls.setup {
      on_attach = on_attach,
      init_options = {
        provideFormatter = false
      }
    }

    require('lspconfig').kotlin_language_server.setup {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end,
      init_options = {
        storagePath = vim.fn.expand('~/.local/share/kotlin-language-server')
      }
    }

    require('lspconfig').lua_ls.setup {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT'
          },
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }

    require('lspconfig').marksman.setup {
      on_attach = on_attach
    }

    require('lspconfig').pyright.setup {
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
        if vim.env.VIRTUAL_ENV then
          config.settings.python.pythonPath = require('lspconfig').util.path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
        end
      end
    }

    require('lspconfig').solargraph.setup {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end
    }

    require('lspconfig').terraformls.setup {
      on_attach = on_attach
    }

    require('lspconfig').ts_ls.setup {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end
    }

    require('lspconfig').typos_lsp.setup {
      on_attach = on_attach,
      init_options = {
        diagnosticSeverity = 'Hint'
      }
    }

    require('lspconfig').vuels.setup {
      on_attach = on_attach
    }
  end
}
