return {
  'ray-x/lsp_signature.nvim',
  config = function ()
    require('lsp_signature').setup {
      hint_enable = false,
      toggle_key = '<C-k>'
    }
  end
}