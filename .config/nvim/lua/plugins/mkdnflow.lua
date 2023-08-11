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
      end
    })
  end,
  ft = { 'markdown' }
}
