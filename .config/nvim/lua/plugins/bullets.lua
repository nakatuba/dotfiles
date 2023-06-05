return {
  'dkarter/bullets.vim',
  init = function()
    vim.g.bullets_set_mappings = 0
    vim.g.bullets_outline_levels = { 'num', 'abc', 'rom' }
  end,
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        vim.keymap.set('i', '<CR>', '<Plug>(bullets-newline)', { buffer = true })
        vim.keymap.set('n', 'o',    '<Plug>(bullets-newline)', { buffer = true })

        vim.keymap.set({'i', 's'}, '<Tab>', function()
          return vim.fn['vsnip#available'](1) == 1 and '<Plug>(vsnip-expand-or-jump)' or '<Plug>(bullets-demote)'
        end, { buffer = true, expr = true })

        vim.keymap.set({'i', 's'}, '<S-Tab>', function()
          return vim.fn['vsnip#jumpable'](-1) == 1 and '<Plug>(vsnip-jump-prev)' or '<Plug>(bullets-promote)'
        end, { buffer = true, expr = true })
      end
    })
  end,
  ft = { 'markdown' }
}
