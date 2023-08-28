return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        -- Actions
        map('n', 'ghs', gs.stage_hunk)
        map('n', 'ghr', gs.reset_hunk)
        map('v', 'ghs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('v', 'ghr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('n', 'ghS', gs.stage_buffer)
        map('n', 'ghu', gs.undo_stage_hunk)
        map('n', 'ghR', gs.reset_buffer)
        map('n', 'ghp', gs.preview_hunk)
        map('n', 'ghb', function() gs.blame_line { full = true } end)
        map('n', 'ghd', gs.diffthis)
        map('n', 'ghD', function() gs.diffthis('~') end)

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-u>Gitsigns select_hunk<CR>')
      end
    }
  end
}
