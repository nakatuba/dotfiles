require('autocmds')
require('keymaps')
require('options')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath
  }
end
vim.opt.rtp:prepend(lazypath)

if vim.g.vscode then
  require('vscode')
else
  require('lazy').setup('plugins', {
    dev = {
      path = vim.fn.stdpath('config') .. '/dev',
      patterns = { 'nakatuba' }
    },
    change_detection = {
      notify = false
    }
  })

  vim.cmd.colorscheme('sonokai')
end
