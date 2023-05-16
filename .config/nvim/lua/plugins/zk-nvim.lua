return {
  'mickael-menu/zk-nvim',
  config = function()
    require('zk').setup {
      picker = 'telescope'
    }

    vim.keymap.set('n', '<leader>nn', '<cmd>ZkNew<CR>')
    vim.keymap.set('n', '<leader>no', '<cmd>ZkNotes<CR>')
  end
}
