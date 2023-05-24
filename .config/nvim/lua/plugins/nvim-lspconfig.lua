return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { focusable = false })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local on_attach = function(client, bufnr)
      vim.keymap.set('n', 'gd',         '<cmd>Telescope lsp_definitions<CR>',                       { buffer = bufnr })
      vim.keymap.set('n', 'gi',         '<cmd>Telescope lsp_implementations<CR>',                   { buffer = bufnr })
      vim.keymap.set('n', 'gr',         '<cmd>Telescope lsp_references<CR>',                        { buffer = bufnr })
      vim.keymap.set('n', 'K',          '<cmd>Lspsaga hover_doc<CR>',                               { buffer = bufnr })
      vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>',                                  { buffer = bufnr })
      vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>',                             { buffer = bufnr })
      vim.keymap.set('n', '<leader>d',  '<cmd>Telescope diagnostics<CR>',                           { buffer = bufnr })
      vim.keymap.set('n', '[d',         '<cmd>lua vim.diagnostic.goto_prev({ float = false })<CR>', { buffer = bufnr })
      vim.keymap.set('n', ']d',         '<cmd>lua vim.diagnostic.goto_next({ float = false })<CR>', { buffer = bufnr })

      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function() vim.lsp.buf.format() end
      })

      vim.api.nvim_create_autocmd('CursorHoldI', {
        buffer = bufnr,
        callback = function() vim.lsp.buf.signature_help() end
      })

      vim.api.nvim_create_autocmd('CursorHold', {
        buffer = bufnr,
        command = 'Lspsaga show_cursor_diagnostics ++unfocus'
      })
    end

    require('lspconfig').tsserver.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end
    }

    require('lspconfig').pyright.setup {
      capabilities = capabilities,
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
        config.settings.python.pythonPath = require('lspconfig').util.path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
      end
    }

    require('lspconfig').solargraph.setup {
      capabilities = capabilities,
      on_attach = on_attach
    }

    require('lspconfig').gopls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        gopls = {
          analyses = {
            staticcheck = true
          }
        }
      }
    }

    require('lspconfig').vimls.setup {
      capabilities = capabilities,
      on_attach = on_attach
    }

    require('lspconfig').lua_ls.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }

    require('lspconfig').terraformls.setup {
      capabilities = capabilities,
      on_attach = on_attach
    }
  end
}
