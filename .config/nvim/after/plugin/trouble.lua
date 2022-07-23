if not pcall(require, 'trouble') then return end

require('trouble').setup {
  action_keys = {
    close = { '<ESC>', 'q' },
    jump_close = { '<CR>', 'o' }
  }
}
