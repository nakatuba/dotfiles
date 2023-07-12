return {
  'jakewvincent/mkdnflow.nvim',
  config = function()
    require('mkdnflow').setup {
      modules = {
        maps = false
      }
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        vim.keymap.set('i', '<CR>', '<cmd>MkdnEnter<CR>', { buffer = true })

        vim.keymap.set('n', 'o', '<cmd>MkdnNewListItemBelowInsert<CR>', { buffer = true })
        vim.keymap.set('n', 'O', '<cmd>MkdnNewListItemAboveInsert<CR>', { buffer = true })

        vim.keymap.set('n', '<leader>ir', '<cmd>MkdnTableNewRowBelow<CR>',  { buffer = true })
        vim.keymap.set('n', '<leader>iR', '<cmd>MkdnTableNewRowAbove<CR>',  { buffer = true })
        vim.keymap.set('n', '<leader>ic', '<cmd>MkdnTableNewColAfter<CR>',  { buffer = true })
        vim.keymap.set('n', '<leader>iC', '<cmd>MkdnTableNewColBefore<CR>', { buffer = true })

        vim.keymap.set({'i', 's'}, '<Tab>', function()
          return vim.fn['vsnip#available'](1) == 1 and '<Plug>(vsnip-expand-or-jump)' or '<cmd>MkdnTab<CR>'
        end, { buffer = true, expr = true })

        vim.keymap.set({'i', 's'}, '<S-Tab>', function()
          return vim.fn['vsnip#jumpable'](-1) == 1 and '<Plug>(vsnip-jump-prev)' or '<cmd>MkdnSTab<CR>'
        end, { buffer = true, expr = true })
      end
    })
  end,
  ft = { 'markdown' }
}
