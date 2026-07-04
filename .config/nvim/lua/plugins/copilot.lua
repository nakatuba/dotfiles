return {
  'github/copilot.vim',
  init = function()
    vim.g.copilot_no_tab_map = true
  end,
  config = function()
    vim.keymap.set('i', '<C-f>', "copilot#Accept('<Right>')", { expr = true, replace_keycodes = false })
    vim.keymap.set('i', '<M-f>', '<Plug>(copilot-accept-word)')
  end
}
