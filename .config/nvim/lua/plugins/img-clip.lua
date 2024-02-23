return {
  'HakonHarnes/img-clip.nvim',
  config = function()
    require('img-clip').setup {
      default = {
        file_name = '%Y%m%d%H%M%S',
        relative_to_current_file = true,
        prompt_for_file_name = false,
        insert_mode_after_paste = false
      }
    }
  end,
  ft = { 'markdown' }
}
