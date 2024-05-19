return {
  'HakonHarnes/img-clip.nvim',
  config = function()
    require('img-clip').setup {
      default = {
        file_name = '%Y%m%d%H%M%S',
        relative_to_current_file = true,
        insert_mode_after_paste = false,
        prompt_for_file_name = false
      }
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        vim.keymap.set('n', '<leader>p', '<cmd>PasteImage<CR>', { buffer = true })
      end
    })
  end,
  ft = { 'markdown' }
}
