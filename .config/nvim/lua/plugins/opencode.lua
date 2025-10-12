return {
  'NickvanDyke/opencode.nvim',
  dependencies = {
    'folke/snacks.nvim'
  },
  config = function()
    vim.g.opencode_opts = {
      terminal = {
        win = {
          enter = true
        }
      }
    }

    vim.keymap.set({'n', 't'}, '<C-.>', function() require('opencode').toggle() end)

    vim.keymap.set('n', '<leader>as', function()
      require('opencode').prompt('@buffer', nil, function()
        local win = require('snacks.terminal').get(
          require('opencode.config').opts.terminal.cmd,
          require('opencode.config').opts.terminal
        )
        if win then
          win:show():focus()
        end
      end)
    end)

    vim.keymap.set('x', '<leader>as', function()
      require('opencode').prompt('@selection', nil, function()
        local win = require('snacks.terminal').get(
          require('opencode.config').opts.terminal.cmd,
          require('opencode.config').opts.terminal
        )
        if win then
          win:show():focus()
        end
      end)
    end)
  end
}
