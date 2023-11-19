return {
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('aerial').setup {
      layout = {
        max_width = 0.9,
        min_width = 30,
        win_opts = {
          winhighlight = 'NormalFloat:Normal,FloatBorder:Blue'
        },
        default_direction = 'float'
      },
      close_automatic_events = { 'unfocus', 'switch_buffer', 'unsupported' },
      float = {
        border = 'single',
        relative = 'win',
        override = function(conf, source_winid)
          conf.anchor = 'NE'
          conf.row = 0
          conf.col = vim.fn.winwidth(source_winid)
          conf.zindex = 50
          return conf
        end
      },
      manage_folds = true,
      on_attach = function(bufnr)
        vim.keymap.set('n', '<C-k>', '<cmd>AerialPrev<CR>', { buffer = bufnr })
        vim.keymap.set('n', '<C-j>', '<cmd>AerialNext<CR>', { buffer = bufnr })
      end
    }

    vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle!<CR>')
  end
}
