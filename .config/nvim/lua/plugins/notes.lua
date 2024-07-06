return {
  'nakatuba/notes.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'vhyrro/luarocks.nvim'
  },
  config = function()
    require('notes').setup {
      dir = '~/Dropbox/Apps/remotely-save/notes',
      daily_notes = {
        dir = '~/Dropbox/Apps/remotely-save/notes/daily'
      }
    }

    vim.keymap.set('n', '<leader>nn', require('notes').new_note)
    vim.keymap.set('n', '<leader>no', require('notes').open_note)
    vim.keymap.set('n', '<leader>nd', require('notes').open_daily_note)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        if vim.startswith(vim.fn.expand('%:p'), vim.fn.expand(require('notes').config.dir)) then
          vim.keymap.set('i', '[[', require('notes').insert_link, { buffer = true })

          vim.keymap.set('n', '<leader>g', function()
            require('telescope.builtin').live_grep {
              cwd = require('notes').config.dir,
            }
          end, { buffer = true })

          vim.keymap.set('n', '<C-g><C-h>', function()
            require('telescope.builtin').git_bcommits {
              cwd = require('notes').config.dir,
            }
          end, { buffer = true })
        end
      end
    })
  end
}
