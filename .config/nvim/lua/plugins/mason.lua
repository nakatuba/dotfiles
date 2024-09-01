return {
  'williamboman/mason.nvim',
  config = function()
    require('mason').setup()

    require('mason-registry'):on('package:install:success', function(pkg)
      if pkg.name == 'cspell' then
        local job = require('plenary.job')
        local cwd = vim.fn.stdpath('data') .. '/mason/packages/cspell'

        job:new({
          command = 'npm',
          args = { 'install', '@cspell/dict-vim' },
          cwd = cwd,
          on_exit = function()
            job:new({
              command = 'cspell',
              args = { 'link', 'add', '@cspell/dict-vim' },
              cwd = cwd
            }):start()
          end
        }):start()
      end
    end)
  end,
  build = ':MasonUpdate'
}
