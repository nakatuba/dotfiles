return {
  settings = {
    python = {
      analysis = {
        autoImportCompletions = false,
        useLibraryCodeForTypes = false
      }
    }
  },
  before_init = function(_, config)
    if vim.env.VIRTUAL_ENV then
      config.settings.python.pythonPath = require('lspconfig').util.path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
    end
  end
}
