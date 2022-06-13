require('neo-tree').setup {
  use_default_mappings = false,
  window = {
    mappings = {
      ['o'] = 'open',
      ['<CR>'] = 'open',
      ['<C-x>'] = 'open_split',
      ['<C-v>'] = 'open_vsplit',
      ['<C-t>'] = 'open_tabnew',
      ['a'] = {
        'add',
        config = {
          show_path = 'relative'
        },
      },
      ['d'] = 'delete',
      ['r'] = 'rename',
      ['y'] = 'copy_to_clipboard',
      ['x'] = 'cut_to_clipboard',
      ['p'] = 'paste_from_clipboard',
      ['c'] = {
        'copy',
        config = {
          show_path = 'relative'
        },
      },
      ['m'] = {
        'move',
        config = {
          show_path = 'relative'
        },
      },
      ['q'] = 'close_window',
      ['/'] = 'fuzzy_finder',
      ['?'] = 'show_help'
    }
  },
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false
    }
  }
}

vim.keymap.set('n', '<leader>e', '<cmd>NeoTreeFloatToggle<CR>')
