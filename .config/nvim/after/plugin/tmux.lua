if not pcall(require, 'tmux') then return end

require('tmux').setup {
  navigation = {
    enable_default_keybindings = false
  },
  resize = {
    enable_default_keybindings = false
  }
}
