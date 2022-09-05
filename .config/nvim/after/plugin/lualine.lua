if not pcall(require, 'lualine') then return end

local function maximize_status()
  return vim.t.maximized and '' or ''
end

require('lualine').setup {
  options = {
    globalstatus = true
  },
  sections = {
    lualine_a = { maximize_status, 'mode' }
  }
}
