return {
  'folke/sidekick.nvim',
  config = function()
    require('sidekick').setup()

    vim.keymap.set('n', '<Tab>', function()
      if not require('sidekick').nes_jump_or_apply() then
        return '<Tab>'
      end
    end, { expr = true })
  end
}
