vim.g.sonokai_transparent_background = 1
vim.g.sonokai_diagnostic_virtual_text = 'colored'
vim.g.sonokai_disable_terminal_colors = 1

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'sonokai',
  command = 'highlight! link VertSplit Normal'
})