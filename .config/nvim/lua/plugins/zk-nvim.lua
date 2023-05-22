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
    vim.keymap.set('n', '<leader>no', '<cmd>ZkNotes<CR>')
    vim.keymap.set('n', '<leader>nc', '<cmd>ZkClean<CR>')
    vim.keymap.set('n', '<leader>ns', '<cmd>ZkSave<CR>')
  end
}
