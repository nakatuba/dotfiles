local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = function()
      if cmp.visible() then
        cmp.close()
      else
        cmp.complete()
      end
    end,
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.config.disable,
    ['<CR>'] = cmp.mapping.confirm()
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' }
  }
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  completion = {
    autocomplete = false
  }
})
