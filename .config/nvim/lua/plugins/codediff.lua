return {
  'esmuellert/codediff.nvim',
  config = function()
    require('codediff').setup {
      explorer = {
        focus_on_select = true,
        auto_open_on_cursor = true
      }
    }
  end
}
