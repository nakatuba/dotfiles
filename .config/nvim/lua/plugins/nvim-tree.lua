return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('nvim-tree').setup {
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.del('n', 's', { buffer = bufnr })
      end,
      sync_root_with_cwd = true,
      view = {
        width = {}
      },
      update_focused_file = {
        enable = true,
        update_root = true
      },
      actions = {
        change_dir = {
          enable = false
        },
        open_file = {
          window_picker = {
            enable = false
          }
        }
      }
    }

    vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')

    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = 'NvimTree*',
      callback = function()
        local api = require('nvim-tree.api')

        if not api.tree.is_visible() then
          api.tree.open()
        end
      end
    })
  end
}
