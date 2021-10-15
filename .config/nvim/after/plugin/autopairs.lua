require('nvim-autopairs').setup()

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

_G.MUtils = {}

MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    return npairs.esc("<cr>")
  else
    return npairs.autopairs_cr()
  end
end

remap('i' , '<CR>', 'v:lua.MUtils.completion_confirm()', { expr = true, noremap = true })
remap('i' , '<C-h>', 'v:lua.MPairs.autopairs_bs()', { expr = true, noremap = true })

local Rule = require('nvim-autopairs.rule')

npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%)') ~= nil
    end)
    :use_key(')'),
  Rule('{ ', ' }')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%}') ~= nil
    end)
    :use_key('}'),
  Rule('[ ', ' ]')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%]') ~= nil
    end)
    :use_key(']')
}
