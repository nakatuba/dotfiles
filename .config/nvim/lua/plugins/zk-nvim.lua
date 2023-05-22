return {
  'mickael-menu/zk-nvim',
  config = function()
    require('zk').setup {
      picker = 'telescope'
    }

    require('zk.commands').add('ZkClean', function()
      vim.fn.system('zk clean')
    end)

    require('zk.commands').add('ZkSave', function()
      vim.fn.system('zk save')
    end)

    vim.keymap.set('n', '<leader>nn', '<cmd>ZkNew<CR>')
    vim.keymap.set('n', '<leader>no', function()
      require('zk').edit(nil, {
        telescope = {
          attach_mappings = function(_, map)
            map('i', '<C-d>', function(prompt_bufnr)
              local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
              if vim.fn.input('Delete selected notes? [y/N]: ') == 'y' then
                picker:delete_selection(function(selection)
                  return vim.fn.delete(selection.path) == 0
                end)
                vim.fn.system('zk index')
              end
            end)
            return true
          end
        }
      })
    end)
    vim.keymap.set('n', '<leader>nc', '<cmd>ZkClean<CR>')
    vim.keymap.set('n', '<leader>ns', '<cmd>ZkSave<CR>')
  end
}
