return {
  'dinhhuy258/git.nvim',
  config = function()
    require('git').setup {
      default_mappings = false,
      keymaps = {
        browse = '<C-g><C-o>'
      }
    }
  end
}
