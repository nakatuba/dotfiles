return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets'
  },
  config = function()
    require('blink.cmp').setup {
      completion = {
        list = {
          selection = {
            preselect = false
          }
        },
        documentation = {
          auto_show = true
        }
      },
      keymap = {
        preset = 'none',
        ['<C-Space>'] = { 'show', 'hide' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          'snippet_forward',
          'fallback'
        },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' }
      },
      signature = {
        enabled = true
      }
    }
  end,
  version = '*'
}
