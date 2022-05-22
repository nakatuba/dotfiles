require('nvim-tree').setup {
  update_focused_file = {
    enable = true
  },
  view = {
    mappings = {
      list = {
        { key = 's', action = '' }
      }
    }
  }
}

vim.keymap.set('n', '<leader>e', "<cmd>NvimTreeToggle<CR>")
