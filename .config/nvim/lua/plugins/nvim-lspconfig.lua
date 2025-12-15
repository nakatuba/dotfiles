return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'folke/snacks.nvim'
  },
  config = function()
    vim.diagnostic.config {
      virtual_text = true,
      float = {
        scope = 'cursor'
      }
    }

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
          return
        end

        if client.name == 'GitHub Copilot' then
          return
        end

        vim.keymap.set('n', 'gd',         function() require('snacks').picker.lsp_definitions()     end, { buffer = args.buf })
        vim.keymap.set('n', 'gi',         function() require('snacks').picker.lsp_implementations() end, { buffer = args.buf })
        vim.keymap.set('n', 'gr',         function() require('snacks').picker.lsp_references()      end, { buffer = args.buf, nowait = true })
        vim.keymap.set('n', 'K',          function() vim.lsp.buf.hover()                            end, { buffer = args.buf })
        vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename()                           end, { buffer = args.buf })
        vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action()                      end, { buffer = args.buf })
        vim.keymap.set('n', '<leader>s',  function() require('snacks').picker.lsp_symbols()         end, { buffer = args.buf })
        vim.keymap.set('n', '<leader>d',  function() require('snacks').picker.diagnostics()         end, { buffer = args.buf })

        vim.api.nvim_create_autocmd('CursorHold', {
          buffer = args.buf,
          callback = function()
            vim.diagnostic.open_float { focusable = false }
          end
        })

        if vim.tbl_contains({ 'lua_ls', 'solargraph', 'ts_ls', 'vue_ls' }, client.name) then
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end

        if client:supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = args.buf,
            callback = function() vim.lsp.buf.format() end
          })
        end
      end
    })
  end
}
