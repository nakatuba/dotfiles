require('nvim-tree').setup {
  view = {
    width = '20%',
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

vim.keymap.set('n', '<leader>e', "<cmd>NvimTreeToggle<CR>")
