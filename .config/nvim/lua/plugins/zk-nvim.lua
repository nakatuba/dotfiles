return {
  'mickael-menu/zk-nvim',
  config = function()
    vim.env.ZK_NOTEBOOK_DIR = vim.fn.expand('~/ghq/github.com/nakatuba/notes')

    require('zk').setup {
      picker = 'telescope'
    }

    require('zk.commands').add('ZkSave', function()
      local path = vim.fn.expand('%:p')
      local root = require('zk.util').notebook_root(path)
      if root then
        vim.fn.system('cd ' .. root .. ' && ./save.sh ' .. path)
      end
    end)

    vim.keymap.set('n', '<leader>nn', '<cmd>ZkNew<CR>')
    vim.keymap.set('n', '<leader>no', '<cmd>ZkNotes<CR>')
    vim.keymap.set('n', '<leader>ns', '<cmd>ZkSave<CR>')
  end
}
