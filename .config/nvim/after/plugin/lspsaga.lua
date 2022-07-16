if not pcall(require, 'lspsaga') then return end

require('lspsaga').init_lsp_saga {
  finder_action_keys = {
    open = '<CR>',
    vsplit = '<C-v>',
    split = '<C-x>',
    tabe = '<C-t>',
    quit = '<Esc>'
  },
  code_action_keys = {
    quit = '<Esc>'
  },
  rename_action_quit = '<Esc>'
}
