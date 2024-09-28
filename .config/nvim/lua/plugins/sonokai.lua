return {
  'sainnhe/sonokai',
  config = function()
    vim.g.sonokai_transparent_background = 1
    vim.g.sonokai_diagnostic_virtual_text = 'colored'
    vim.g.sonokai_disable_terminal_colors = 1

    vim.api.nvim_create_autocmd('ColorScheme', {
      group = vim.api.nvim_create_augroup('sonokai', { clear = true }),
      pattern = 'sonokai',
      callback = function()
        vim.api.nvim_set_hl(0, 'VertSplit', { link = 'Grey' })
      end
    })
  end
}
