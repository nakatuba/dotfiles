return {
  'gbprod/substitute.nvim',
  config = function()
    require('substitute').setup()

    vim.keymap.set('n', 'gs', function()
      if vim.env.TMUX then
        require('tmux').sync_registers()
      end
      require('substitute').operator()
    end)
    vim.keymap.set('n', 'gss', function()
      if vim.env.TMUX then
        require('tmux').sync_registers()
      end
      require('substitute').line()
    end)
    vim.keymap.set('n', 'gS', function()
      if vim.env.TMUX then
        require('tmux').sync_registers()
      end
      require('substitute').eol()
    end)
    vim.keymap.set('x', 'gs', function()
      if vim.env.TMUX then
        require('tmux').sync_registers()
      end
      require('substitute').visual()
    end)

    vim.keymap.set('n', 'cx',  "<cmd>lua require('substitute.exchange').operator()<CR>")
    vim.keymap.set('n', 'cxx', "<cmd>lua require('substitute.exchange').line()<CR>")
    vim.keymap.set('x', 'X',   "<cmd>lua require('substitute.exchange').visual()<CR>")
    vim.keymap.set('n', 'cxc', "<cmd>lua require('substitute.exchange').cancel()<CR>")
  end
}
