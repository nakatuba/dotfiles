return {
  'nakatuba/notes.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim'
  },
  config = function()
    require('notes').setup {
      dir = '~/Dropbox/notes'
    }

    vim.keymap.set('n', '<leader>nn', require('notes').new)
    vim.keymap.set('n', '<leader>no', require('notes').open)

    vim.api.nvim_create_autocmd('BufEnter', {
      callback = function()
        if vim.fn.getcwd() == vim.fn.resolve(vim.fn.expand('~/Dropbox/notes')) then
          vim.keymap.set('n', '<leader>f', require('notes').open,        { buffer = true })
          vim.keymap.set('i', '[[',        require('notes').insert_link, { buffer = true })
        end
      end
    })
  end
}
