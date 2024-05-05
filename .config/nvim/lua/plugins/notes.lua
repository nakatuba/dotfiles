return {
  'nakatuba/notes.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'vhyrro/luarocks.nvim'
  },
  config = function()
    require('notes').setup {
      dir = '~/Dropbox/Apps/remotely-save/notes',
    }

    vim.keymap.set('n', '<leader>nn', require('notes').new_note)
    vim.keymap.set('n', '<leader>no', require('notes').open_note)
    vim.keymap.set('n', '<leader>ng', require('notes').search_notes)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        if vim.fn.expand('%:p:h') == vim.fn.expand(require('notes').config.dir) then
          vim.keymap.set('i', '[[', require('notes').insert_link, { buffer = true })
        end
      end
    })
  end
}
