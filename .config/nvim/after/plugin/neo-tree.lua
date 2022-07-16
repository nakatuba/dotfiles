if not pcall(require, 'neo-tree') then return end

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
      ['y'] = function(state)
        local node = state.tree:get_node()
        vim.fn.setreg('*', node.name)
      end,
      ['Y'] = function(state)
        local node = state.tree:get_node()
        vim.fn.setreg('*', node.path:sub(#state.path + 2))
      end,
      ['gy'] = function(state)
        local node = state.tree:get_node()
        vim.fn.setreg('*', node.path)
      end,
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
