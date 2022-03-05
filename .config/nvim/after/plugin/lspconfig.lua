local on_attach = function(client, bufnr)
  require('lspsaga').init_lsp_saga {
    code_action_keys = {
      quit = '<Esc>'
    },
    rename_action_keys = {
      quit = '<Esc>'
    }
  }

  local opts = { noremap = true, silent = true }

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>Lspsaga code_action<CR>',          opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',          '<cmd>Lspsaga hover_doc<CR>',            opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>Lspsaga rename<CR>',               opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d',         '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d',         '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)

  vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
  vim.api.nvim_command [[autocmd CursorHoldI <buffer> Lspsaga signature_help]]
  vim.api.nvim_command [[autocmd CursorHold  <buffer> Lspsaga show_cursor_diagnostics]]
end

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
