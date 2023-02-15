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
  }
}

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
