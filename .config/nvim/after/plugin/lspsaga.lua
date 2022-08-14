if not pcall(require, 'lspsaga') then return end

require('lspsaga').init_lsp_saga {
  code_action_keys = {
    quit = '<Esc>'
  },
  rename_action_quit = '<Esc>',
  rename_in_select = false
}
