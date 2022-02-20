require('nvim-tree').setup {
  auto_close = true,
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
