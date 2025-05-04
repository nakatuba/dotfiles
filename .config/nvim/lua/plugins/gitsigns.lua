return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk('next')
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk('prev')
          end
        end)

        -- Actions
        map('n', 'ghs', gitsigns.stage_hunk)
        map('n', 'ghr', gitsigns.reset_hunk)

        map('v', 'ghs', function()
          gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
        end)

        map('v', 'ghr', function()
          gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') }
        end)

        map('n', 'ghS', gitsigns.stage_buffer)
        map('n', 'ghu', gitsigns.undo_stage_hunk)
        map('n', 'ghR', gitsigns.reset_buffer)
        map('n', 'ghp', gitsigns.preview_hunk)

        map('n', 'ghb', function()
          gitsigns.blame_line { full = true }
        end)

        map('n', 'ghd', gitsigns.diffthis)

        map('n', 'ghD', function()
          gitsigns.diffthis('~')
        end)

        -- Text object
        map({'o', 'x'}, 'ih', gitsigns.select_hunk)
      end
    }

    vim.api.nvim_create_autocmd('FocusGained', {
      callback = function()
        require('gitsigns').refresh()
      end
    })
  end
}
