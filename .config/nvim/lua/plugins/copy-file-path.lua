return {
  'h3pei/copy-file-path.nvim',
  config = function()
    vim.keymap.set({'n', 'x'}, 'gyf', ':CopyFileName<CR>', { silent = true })
    vim.keymap.set({'n', 'x'}, 'gyp', ':CopyFilePath<CR>', { silent = true })
  end
}
