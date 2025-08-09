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
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
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
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' }
      },
      signature = {
        enabled = true
      },
      cmdline = {
        completion = {
          list = {
            selection = {
              preselect = false
            }
          }
        },
        keymap = {
          preset = 'none',
          ['<Tab>'] = { 'show_and_insert', 'select_next' },
          ['<S-Tab>'] = { 'show_and_insert', 'select_prev' },
          ['<C-Space>'] = { 'show', 'hide' },
          ['<C-p>'] = { 'select_prev', 'fallback' },
          ['<C-n>'] = { 'select_next', 'fallback' }
        }
      }
    }
  end,
  version = '*'
}
