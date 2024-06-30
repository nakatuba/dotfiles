return {
  'aserowy/tmux.nvim',
  config = function()
    require('tmux').setup {
      navigation = {
        enable_default_keybindings = false
      },
      resize = {
        enable_default_keybindings = false
      }
    }

    vim.api.nvim_create_autocmd('FocusGained', {
      callback = function()
        if vim.env.TMUX then
          require('tmux').sync_registers()
        end
      end
    })
  end
}
