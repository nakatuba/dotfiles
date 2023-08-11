return {
  'hrsh7th/vim-vsnip',
  dependencies = {
    'rafamadriz/friendly-snippets'
  },
  config = function()
    vim.keymap.set({'i', 's'}, '<Tab>', function()
      if vim.fn['vsnip#available'](1) == 1 then
        return '<Plug>(vsnip-expand-or-jump)'
      elseif vim.bo.filetype == 'markdown' then
        return '<C-t>'
      else
        return '<Tab>'
      end
    end, { expr = true })

    vim.keymap.set({'i', 's'}, '<S-Tab>', function()
      if vim.fn['vsnip#jumpable'](-1) == 1 then
        return '<Plug>(vsnip-jump-prev)'
      elseif vim.bo.filetype == 'markdown' then
        return '<C-d>'
      else
        return '<S-Tab>'
      end
    end, { expr = true })
  end
}
