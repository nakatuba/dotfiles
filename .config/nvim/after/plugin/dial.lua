if not pcall(require, 'dial.augend') then return end

local augend = require('dial.augend')

require('dial.config').augends:register_group {
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.date.alias['%Y/%m/%d'],
    augend.date.alias['%Y-%m-%d'],
    augend.date.alias['%m/%d'],
    augend.date.alias['%H:%M'],
    augend.constant.alias.bool,
    augend.constant.new {
      elements = { 'True', 'False' }
    }
  }
}

vim.keymap.set('n', '<C-a>',  require('dial.map').inc_normal())
vim.keymap.set('n', '<C-x>',  require('dial.map').dec_normal())
vim.keymap.set('v', '<C-a>',  require('dial.map').inc_visual())
vim.keymap.set('v', '<C-x>',  require('dial.map').dec_visual())
vim.keymap.set('v', 'g<C-a>', require('dial.map').inc_gvisual())
vim.keymap.set('v', 'g<C-x>', require('dial.map').dec_gvisual())
