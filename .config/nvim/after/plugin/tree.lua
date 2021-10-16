require('nvim-tree').setup {
  auto_close = true,
  update_focused_file = {
    enable = true
  },
  view = {
    mappings = {
      list = {
        { key = 's', cb = '<C-w>' }
      }
    }
  }
}

vim.g.nvim_tree_quit_on_open = 1
