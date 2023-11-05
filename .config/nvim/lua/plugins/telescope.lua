return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local actions = require('telescope.actions')
    local action_layout = require('telescope.actions.layout')

    require('telescope').setup {
      defaults = {
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = {
            preview_width = 0.5
          }
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
          '--follow',
          '--glob',
          '!.git'
        },
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ['<C-f>'] = false,
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
        buffers = {
          mappings = {
            i = {
              ['<C-d>'] = actions.delete_buffer
            }
          }
        },
        lsp_definitions = {
          show_line = false
        },
        lsp_implementations = {
          show_line = false
        },
        lsp_references = {
          show_line = false
        }
      }
    }

    vim.keymap.set('n', '<leader>f',  '<cmd>Telescope find_files<CR>')
    vim.keymap.set('n', '<leader>g',  '<cmd>Telescope live_grep<CR>')
    vim.keymap.set('n', '<leader>b',  '<cmd>Telescope buffers<CR>')
    vim.keymap.set('n', '<leader>h',  '<cmd>Telescope oldfiles<CR>')
    vim.keymap.set('n', '<C-g><C-f>', '<cmd>Telescope git_status<CR>')
  end
}
