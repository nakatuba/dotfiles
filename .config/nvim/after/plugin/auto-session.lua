if not pcall(require, 'auto-session') then return end

function _G.close_all_floating_wins()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= '' then
      vim.api.nvim_win_close(win, false)
    end
  end
end

require('auto-session').setup {
  log_level = 'error',
  auto_restore_enabled = false,
  pre_save_cmds = { _G.close_all_floating_wins }
}

vim.keymap.set('n', '<leader>rs', '<cmd>RestoreSession<CR>')
