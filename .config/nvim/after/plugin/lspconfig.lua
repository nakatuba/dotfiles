if not pcall(require, 'lspconfig') then return end

local on_attach = function(client, bufnr)
  vim.keymap.set('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>',                    { buffer = bufnr })
  vim.keymap.set('n', 'gr',         '<cmd>Telescope lsp_references<CR>',                        { buffer = bufnr })
  vim.keymap.set('n', 'K',          '<cmd>Lspsaga hover_doc<CR>',                               { buffer = bufnr })
  vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>',                                  { buffer = bufnr })
  vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>',                             { buffer = bufnr })
  vim.keymap.set('n', '<leader>d',  '<cmd>Telescope diagnostics<CR>',                           { buffer = bufnr })
  vim.keymap.set('n', '[d',         '<cmd>lua vim.diagnostic.goto_prev({ float = false })<CR>', { buffer = bufnr })
  vim.keymap.set('n', ']d',         '<cmd>lua vim.diagnostic.goto_next({ float = false })<CR>', { buffer = bufnr })

  vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
  vim.cmd [[autocmd CursorHoldI <buffer> Lspsaga signature_help]]
  vim.cmd [[autocmd CursorHold  <buffer> Lspsaga show_cursor_diagnostics]]
end

require('lspconfig').tsserver.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end
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
    config.settings.python.pythonPath = require('lspconfig').util.path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end
}

require('lspconfig').solargraph.setup {
  on_attach = on_attach
}

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

require('lspconfig').vuels.setup {
  on_attach = on_attach
}

require('lspconfig').vimls.setup {
  on_attach = on_attach
}

require('lspconfig').sumneko_lua.setup {
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
