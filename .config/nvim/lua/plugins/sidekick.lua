return {
  'folke/sidekick.nvim',
  config = function()
    require('sidekick').setup {
      cli = {
        win = {
          wo = {
            winhighlight = 'NormalFloat:Normal'
          },
          keys = {
            prompt = false,
            nav_left = false,
            nav_down = false,
            nav_up = false,
            nav_right = false
          }
        }
      }
    }

    vim.keymap.set('n', '<Tab>', function()
      if not require('sidekick').nes_jump_or_apply() then
        return '<Tab>'
      end
    end, { expr = true })

    vim.keymap.set({'n', 'i', 'x', 't'}, '<C-.>', function()
      require('sidekick.cli').toggle()
    end)

    vim.keymap.set('n', '<leader>as', function()
      require('sidekick.cli').send { msg = '{file}' }
    end)

    vim.keymap.set('x', '<leader>as', function()
      require('sidekick.cli').send { msg = '{line}' }
    end)
  end
}
