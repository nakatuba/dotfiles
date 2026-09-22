return {
  'polacekpavel/prompt-yank.nvim',
  config = function()
    require('prompt-yank').setup {
      formats = {
        default = '{filepath}{lines_hash}'
      },
      keymaps = {
        copy_file = 'gyp',
        copy_selection = 'gyp'
      }
    }
  end
}
