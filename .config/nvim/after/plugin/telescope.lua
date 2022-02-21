local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')

require('telescope').setup {
  defaults = {
    scroll_strategy = 'limit',
    sorting_strategy = 'ascending',
    layout_config = {
      scroll_speed = 1,
      preview_width = 0.5
    },
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
        ['<C-_>'] = action_layout.toggle_preview,
        ['<Esc>'] = actions.close
      }
    }
  },
  pickers = {
    find_files = {
      sorting_strategy = 'descending',
      find_command = { 'fd', '--type', 'f', '--hidden', '--follow', '--exclude', '.git' }
    },
    lsp_definitions = {
      jump_type = 'never'
    },
    git_status = {
      sorting_strategy = 'descending'
    }
  }
}
