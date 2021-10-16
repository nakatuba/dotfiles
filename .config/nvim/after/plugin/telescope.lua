local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    scroll_strategy = 'limit',
    layout_config = {
      scroll_speed = 1
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
        ['<Tab>'] = actions.toggle_selection + actions.move_selection_better,
        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_worse,
        ['<ESC>'] = actions.close
      }
    }
  },
  pickers = {
    find_files = {
      find_command = { 'fd', '--type', 'f', '--hidden', '--follow', '--exclude', '.git' }
    },
    grep_string = {
      sorting_strategy = 'ascending'
    },
    live_grep = {
      sorting_strategy = 'ascending'
    },
    git_commits = {
      sorting_strategy = 'ascending'
    }
  }
}
