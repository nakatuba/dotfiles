if not pcall(require, 'lspconfig') then return end

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>',                    opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',         '<cmd>TroubleToggle lsp_references<CR>',                    opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>Lspsaga code_action<CR>',                             opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',          '<cmd>Lspsaga hover_doc<CR>',                               opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>Lspsaga rename<CR>',                                  opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D',  '<cmd>TroubleToggle workspace_diagnostics<CR>',             opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>d',  '<cmd>TroubleToggle document_diagnostics<CR>',              opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d',         '<cmd>lua vim.diagnostic.goto_prev({ float = false })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d',         '<cmd>lua vim.diagnostic.goto_next({ float = false })<CR>', opts)

  vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
  vim.api.nvim_command [[autocmd CursorHoldI <buffer> Lspsaga signature_help]]
  vim.api.nvim_command [[autocmd CursorHold  <buffer> Lspsaga show_cursor_diagnostics]]
end

require('lspconfig').tsserver.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
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
  on_attach = on_attach,
  settings = {
    vetur = {
      ignoreProjectWarning = true
    }
  }
}
