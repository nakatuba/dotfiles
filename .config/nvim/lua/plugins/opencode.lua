return {
  'nickjvandyke/opencode.nvim',
  dependencies = {
    'folke/snacks.nvim'
  },
  config = function()
    local function relative_path(buf)
      local buftype = vim.api.nvim_get_option_value('buftype', { buf = buf })
      if buftype ~= '' then return nil end
      local name = vim.api.nvim_buf_get_name(buf)
      if name == '' then return nil end
      return '@' .. vim.fn.fnamemodify(name, ':.')
    end

    local function format_range(path, args)
      if not args or not args.start_line then return path end
      if args.end_line and args.start_line > args.end_line then
        args.start_line, args.end_line = args.end_line, args.start_line
        if args.start_col and args.end_col then
          args.start_col, args.end_col = args.end_col, args.start_col
        end
      end
      local result = path .. ':' .. string.format('L%d', args.start_line)
      if args.start_col then
        result = result .. string.format(':C%d', args.start_col)
      end
      if args.end_line and args.end_line ~= args.start_line then
        result = result .. string.format('-L%d', args.end_line)
        if args.end_col then
          result = result .. string.format(':C%d', args.end_col)
        end
      end
      return result
    end

    vim.g.opencode_opts = {
      contexts = {
        ['@buffer'] = function(context)
          return relative_path(context.buf)
        end,
        ['@this'] = function(context)
          local path = relative_path(context.buf)
          if not path then return nil end
          if context.range then
            return format_range(path, {
              start_line = context.range.from[1],
              start_col = (context.range.kind ~= 'line') and context.range.from[2] or nil,
              end_line = context.range.to[1],
              end_col = (context.range.kind ~= 'line') and context.range.to[2] or nil
            })
          else
            return format_range(path, {
              start_line = context.cursor[1],
              start_col = context.cursor[2] + 1
            })
          end
        end
      }
    }

    local function focus_tmux_pane()
      require('opencode.server').get():next(function(server)
        local lsof_result = vim.system({ 'lsof', '-i', ':' .. server.port, '-t' }):wait()
        if lsof_result.code == 0 and lsof_result.stdout then
          local pid = lsof_result.stdout:match('%d+')
          if pid then
            local panes_result = vim.system({ 'tmux', 'list-panes', '-s', '-F', '#{window_id}:#{pane_id}:#{pane_pid}' }):wait()
            if panes_result.code == 0 and panes_result.stdout then
              for line in panes_result.stdout:gmatch('[^\r\n]+') do
                local window_id, pane_id, pane_pid = line:match('([^:]+):([^:]+):(%d+)')
                if pane_pid then
                  local pgrep_result = vim.system({ 'pgrep', '-P', pane_pid }):wait()
                  local child_pids = pgrep_result.code == 0 and pgrep_result.stdout
                    and vim.split(vim.trim(pgrep_result.stdout), '\n') or {}
                  if pane_pid == pid or vim.list_contains(child_pids, pid) then
                    vim.system({ 'tmux', 'select-window', '-t', window_id })
                    vim.system({ 'tmux', 'select-pane', '-t', pane_id })
                    return
                  end
                end
              end
            end
          end
        end
      end)
    end

    vim.keymap.set('n', '<leader>as', function()
      require('opencode').prompt('@buffer '):next(focus_tmux_pane)
    end)
    vim.keymap.set('x', '<leader>as', function()
      require('opencode').prompt('@this '):next(focus_tmux_pane)
    end)
  end
}
