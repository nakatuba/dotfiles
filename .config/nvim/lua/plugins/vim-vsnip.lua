return {
  'hrsh7th/vim-vsnip',
  dependencies = {
    'rafamadriz/friendly-snippets'
  },
  config = function()
    vim.keymap.set({'i', 's'}, '<Tab>', function()
      return vim.fn['vsnip#available'](1) == 1 and '<Plug>(vsnip-expand-or-jump)' or '<Tab>'
    end, { expr = true })
    vim.keymap.set({'i', 's'}, '<S-Tab>', function()
      return vim.fn['vsnip#jumpable'](-1) == 1 and '<Plug>(vsnip-jump-prev)' or '<S-Tab>'
    end, { expr = true })
  end
}
