if not pcall(require, 'onedark') then return end

require('onedark').setup {
  transparent = true,
  term_colors = false,
  diagnostics = {
    darker = false,
    undercurl = false,
    background = false
  }
}
