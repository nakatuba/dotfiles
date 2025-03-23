return {
  'gbprod/substitute.nvim',
  config = function()
    require('substitute').setup()

    vim.keymap.set('n', 'gs',  require('substitute').operator)
    vim.keymap.set('n', 'gss', require('substitute').line)
    vim.keymap.set('n', 'gS',  require('substitute').eol)
    vim.keymap.set('x', 'gs',  require('substitute').visual)

    vim.keymap.set('n', ',s',  require('substitute.range').operator)
    vim.keymap.set('x', ',s',  require('substitute.range').visual)
    vim.keymap.set('n', ',ss', require('substitute.range').word)

    vim.keymap.set('n', 'cx',  require('substitute.exchange').operator)
    vim.keymap.set('n', 'cxx', require('substitute.exchange').line)
    vim.keymap.set('x', 'X',   require('substitute.exchange').visual)
    vim.keymap.set('n', 'cxc', require('substitute.exchange').cancel)
  end
}
