return {
  'akinsho/bufferline.nvim',
  config = function()
    require('bufferline').setup {
      options = {
        indicator = {
          style = 'none'
        },
        diagnostics = 'nvim_lsp',
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            text_align = 'left',
            separator = true
          }
        }
      }
    }

    vim.keymap.set('n', '<C-p>', '<cmd>BufferLineCyclePrev<CR>')
    vim.keymap.set('n', '<C-n>', '<cmd>BufferLineCycleNext<CR>')
    vim.keymap.set('n', '<M-p>', '<cmd>BufferLineMovePrev<CR>')
    vim.keymap.set('n', '<M-n>', '<cmd>BufferLineMoveNext<CR>')

    vim.keymap.set('n', 'sp', function() vim.cmd.tabprev() end)
    vim.keymap.set('n', 'sn', function() vim.cmd.tabnext() end)
    vim.keymap.set('n', 'sP', function()
      if vim.fn.tabpagenr() == 1 then
        vim.cmd.tabmove()
      else
        vim.cmd.tabmove('-')
      end
    end)
    vim.keymap.set('n', 'sN', function()
      if vim.fn.tabpagenr() == vim.fn.tabpagenr('$') then
        vim.cmd.tabmove('0')
      else
        vim.cmd.tabmove('+')
      end
    end)
    vim.keymap.set('n', 's,', function()
      vim.ui.input({ prompt = 'Rename tab to: ' }, function(input)
        require('bufferline').rename_tab { input }
      end)
    end)
  end
}
