if not pcall(require, 'maximize') then return end

vim.keymap.set('n', '<CR>', function ()
  require('maximize').toggle()
  require('lualine').refresh()
end)
