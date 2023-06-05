return {
  'toppair/peek.nvim',
  config = function()
    require('peek').setup {
      app = 'browser'
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        vim.keymap.set('n', '<leader>mp', require('peek').open, { buffer = true })
      end
    })
  end,
  build = 'deno task --quiet build:fast',
  ft = { 'markdown' }
}
