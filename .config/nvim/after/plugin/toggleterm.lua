if not pcall(require, 'toggleterm') then return end

require('toggleterm').setup {
  open_mapping = '<C-Space>'
}
