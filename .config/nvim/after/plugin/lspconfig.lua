local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>',      opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

  require('lspsaga').init_lsp_saga {
    rename_action_keys = {
      quit = '<Esc>'
    }
  }

  buf_set_keymap('n', '<leader>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)

  vim.api.nvim_command [[autocmd CursorHoldI <buffer> lua require('lspsaga.signaturehelp').signature_help()]]
  vim.api.nvim_command [[autocmd CursorHold  <buffer> lua require('lspsaga.diagnostic').show_cursor_diagnostics()]]
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

nvim_lsp.gopls.setup {
  on_attach = on_attach
}

nvim_lsp.vuels.setup {
  on_attach = on_attach,
  settings = {
    vetur = {
      ignoreProjectWarning = true
    }
  }
}
