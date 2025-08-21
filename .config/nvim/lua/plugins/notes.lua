return {
  'nakatuba/notes.nvim',
  dependencies = {
    'folke/snacks.nvim'
  },
  config = function()
    require('notes').setup {
      dir = '~/Dropbox/Apps/remotely-save/notes'
    }

    vim.keymap.set('n', '<leader>nn', require('notes').new_note)
    vim.keymap.set('n', '<leader>no', require('notes').open_note)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        if vim.startswith(vim.fn.expand('%:p'), vim.fn.expand(require('notes').config.dir)) then
          vim.keymap.set('i', '[[', require('notes').insert_link, { buffer = true })
        end
      end
    })
  end
}
