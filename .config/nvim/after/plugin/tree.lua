if not pcall(require, 'nvim-tree') then return end

require('nvim-tree').setup {
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = 's', action = '' }
      }
    }
  },
  update_focused_file = {
    enable = true
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
}

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
