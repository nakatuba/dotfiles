if not pcall(require, 'nvim-tree') then return end

require('nvim-tree').setup {
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = 's',     action = '' },
        { key = '<ESC>', action = 'close' }
      }
    },
    float = {
      enable = true
    }
  },
  update_focused_file = {
    enable = true
  }
}

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
