local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')

require('telescope').setup {
  defaults = {
    scroll_strategy = 'limit',
    layout_config = {
      preview_width = 0.5
    },
    cycle_layout_list = { 'vertical', 'horizontal' },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--glob',
      '!.git'
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-k>'] = actions.preview_scrolling_up,
        ['<C-j>'] = actions.preview_scrolling_down,
        ['<Tab>'] = actions.toggle_selection + actions.move_selection_next,
        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_previous,
        ['<C-/>'] = action_layout.cycle_layout_next,
        ['<C-_>'] = action_layout.cycle_layout_next,
        ['<Esc>'] = actions.close
      }
    }
  },
  pickers = {
    find_files = {
      find_command = { 'fd', '--type', 'f', '--hidden', '--follow', '--exclude', '.git' }
    },
    live_grep = {
      sorting_strategy = 'ascending'
    },
    buffers = {
      sorting_strategy = 'ascending',
      mappings = {
        i = {
          ['<C-d>'] = actions.delete_buffer
        }
      }
    },
    oldfiles = {
      sorting_strategy = 'ascending'
    },
    colorscheme = {
      enable_preview = true
    },
    lsp_definitions = {
      sorting_strategy = 'ascending',
      show_line = false
    },
    lsp_implementations = {
      sorting_strategy = 'ascending',
      show_line = false
    },
    lsp_references = {
      sorting_strategy = 'ascending',
      show_line = false
    },
    lsp_document_symbols = {
      sorting_strategy = 'ascending'
    },
    diagnostics = {
      sorting_strategy = 'ascending'
    }
  }
}

vim.keymap.set('n', '<leader>f',  '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>g',  '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>b',  '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>h',  '<cmd>Telescope oldfiles<CR>')
vim.keymap.set('n', '<leader>cs', '<cmd>Telescope colorscheme<CR>')
vim.keymap.set('n', '<C-g><C-f>', '<cmd>Telescope git_status<CR>')
