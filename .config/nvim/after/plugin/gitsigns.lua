require('gitsigns').setup {
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

    -- Actions
    map('n', 'ghs', ':Gitsigns stage_hunk<CR>')
    map('v', 'ghs', ':Gitsigns stage_hunk<CR>')
    map('n', 'ghr', ':Gitsigns reset_hunk<CR>')
    map('v', 'ghr', ':Gitsigns reset_hunk<CR>')
    map('n', 'ghS', '<cmd>Gitsigns stage_buffer<CR>')
    map('n', 'ghu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    map('n', 'ghR', '<cmd>Gitsigns reset_buffer<CR>')
    map('n', 'ghp', '<cmd>Gitsigns preview_hunk<CR>')
    map('n', 'ghb', '<cmd>lua require("gitsigns").blame_line { full = true }<CR>')
    map('n', 'ghd', '<cmd>Gitsigns diffthis<CR>')
    map('n', 'ghD', '<cmd>lua require("gitsigns").diffthis("~")<CR>')

    -- Text object
    map('o', 'ih', ':<C-u>Gitsigns select_hunk<CR>')
    map('x', 'ih', ':<C-u>Gitsigns select_hunk<CR>')
  end
}
