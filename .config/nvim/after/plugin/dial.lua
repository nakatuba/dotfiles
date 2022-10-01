local status, augend = pcall(require, 'dial.augend')
if not status then return end

require('dial.config').augends:register_group {
  bool = {
    augend.constant.new {
      elements = { 'true', 'false' },
      preserve_case = true
    }
  }
}

vim.keymap.set('n', 'S', require('dial.map').inc_normal('bool'))
