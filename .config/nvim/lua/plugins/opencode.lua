return {
  'NickvanDyke/opencode.nvim',
  dependencies = {
    'folke/snacks.nvim'
  },
  config = function()
    vim.g.opencode_opts = {
      on_opencode_not_found = function()
        vim.system({ 'tmux', 'split-window', '-h', 'opencode' })
      end,
      on_send = function()
        require('opencode.cli.server').get_port(function(ok, port)
          if ok then
            local lsof_result = vim.system({ 'lsof', '-i', ':' .. port, '-t' }):wait()
            if lsof_result.code == 0 and lsof_result.stdout then
              local pid = lsof_result.stdout:match('%d+')
              if pid then
                local panes_result = vim.system({ 'tmux', 'list-panes', '-s', '-F', '#{window_id}:#{pane_id}:#{pane_pid}' }):wait()
                if panes_result.code == 0 and panes_result.stdout then
                  for line in panes_result.stdout:gmatch('[^\r\n]+') do
                    local window_id, pane_id, pane_pid = line:match('([^:]+):([^:]+):(%d+)')
                    if pane_pid then
                      local pgrep_result = vim.system({ 'pgrep', '-P', pane_pid }):wait()
                      if pane_pid == pid or pgrep_result.code == 0 and pgrep_result.stdout:match(pid) then
                        vim.system({ 'tmux', 'select-window', '-t', window_id })
                        vim.system({ 'tmux', 'select-pane', '-t', pane_id })
                        return
                      end
                    end
                  end
                end
              end
            end
          end
        end)
      end
    }

    vim.keymap.set('n', '<leader>as', function() require('opencode').prompt('@buffer') end)
    vim.keymap.set('x', '<leader>as', function() require('opencode').prompt('@selection') end)
  end
}
