return {
  'aserowy/tmux.nvim',
  config = function()
    require('tmux').setup {
      copy_sync = {
        sync_registers_keymap_put = false,
        sync_registers_keymap_reg = false
      },
      navigation = {
        cycle_navigation = false,
        enable_default_keybindings = false
      },
      resize = {
        enable_default_keybindings = false
      }
    }

    vim.keymap.set('n', 'sh', require('tmux').move_left)
    vim.keymap.set('n', 'sj', require('tmux').move_bottom)
    vim.keymap.set('n', 'sk', require('tmux').move_top)
    vim.keymap.set('n', 'sl', require('tmux').move_right)

    vim.api.nvim_create_autocmd('FocusGained', {
      group = vim.api.nvim_create_augroup('tmux_sync_registers', { clear = true }),
      callback = function()
        if vim.env.TMUX then
          require('tmux').sync_registers()
        end
      end
    })
  end
}
