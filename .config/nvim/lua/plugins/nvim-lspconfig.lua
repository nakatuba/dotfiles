return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'folke/snacks.nvim'
  },
  config = function()
    vim.diagnostic.config {
      virtual_text = true,
      float = {
        focusable = false,
        scope = 'cursor'
      }
    }

    vim.lsp.config('*', {
      on_attach = function(_, bufnr)
        vim.keymap.set('n', 'gd',         function() require('snacks').picker.lsp_definitions() end,     { buffer = bufnr })
        vim.keymap.set('n', 'gi',         function() require('snacks').picker.lsp_implementations() end, { buffer = bufnr })
        vim.keymap.set('n', 'gr',         function() require('snacks').picker.lsp_references() end,      { buffer = bufnr, nowait = true })
        vim.keymap.set('n', 'K',          function() vim.lsp.buf.hover() end,                            { buffer = bufnr })
        vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end,                           { buffer = bufnr })
        vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end,                      { buffer = bufnr })
        vim.keymap.set('n', '<leader>s',  function() require('snacks').picker.lsp_symbols() end,         { buffer = bufnr })
        vim.keymap.set('n', '<leader>d',  function() require('snacks').picker.diagnostics() end,         { buffer = bufnr })

        vim.api.nvim_create_autocmd('CursorHold', {
          buffer = bufnr,
          callback = function()
            vim.diagnostic.open_float()
          end
        })
      end
    })
  end
}
