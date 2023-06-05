return {
  'monaqa/dial.nvim',
  config = function()
    local augend = require('dial.augend')
    local default = {
      augend.integer.alias.decimal,
      augend.integer.alias.hex,
      augend.date.alias['%Y/%m/%d'],
      augend.date.alias['%Y-%m-%d'],
      augend.date.alias['%m/%d'],
      augend.date.alias['%H:%M'],
      augend.constant.alias.bool
    }

    require('dial.config').augends:register_group {
      default = default
    }

    require('dial.config').augends:on_filetype {
      python = {
        unpack(default),
        augend.constant.new {
          elements = { 'True', 'False' }
        }
      },
      markdown = {
        unpack(default),
        augend.misc.alias.markdown_header,
        augend.user.new {
          find = function(line, cursor)
            local s, e = line:find('- %[[ x]%]')
            if s and line:sub(1, s - 1):match('^%s*$') then
              return { from = s, to = e }
            end
          end,
          add = function(text, addend, cursor)
            if text == '- [ ]' then
              return { text = '- [x]', cursor = 4 }
            elseif text == '- [x]' then
              return { text = '- [ ]', cursor = 4 }
            end
          end
        }
      }
    }

    vim.keymap.set('n', '<C-a>',  require('dial.map').inc_normal())
    vim.keymap.set('n', '<C-x>',  require('dial.map').dec_normal())
    vim.keymap.set('n', 'g<C-a>', require('dial.map').inc_gnormal())
    vim.keymap.set('n', 'g<C-x>', require('dial.map').dec_gnormal())
    vim.keymap.set('v', '<C-a>',  require('dial.map').inc_visual())
    vim.keymap.set('v', '<C-x>',  require('dial.map').dec_visual())
    vim.keymap.set('v', 'g<C-a>', require('dial.map').inc_gvisual())
    vim.keymap.set('v', 'g<C-x>', require('dial.map').dec_gvisual())
  end
}
