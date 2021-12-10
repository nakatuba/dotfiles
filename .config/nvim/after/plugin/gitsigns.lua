require('gitsigns').setup {
  keymaps = {
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},

    ['n ghs'] = '<cmd>Gitsigns stage_hunk<CR>',
    ['v ghs'] = '<cmd>Gitsigns stage_hunk<CR>',
    ['n ghu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
    ['n ghr'] = '<cmd>Gitsigns reset_hunk<CR>',
    ['v ghr'] = '<cmd>Gitsigns reset_hunk<CR>',
    ['n ghp'] = '<cmd>Gitsigns preview_hunk<CR>',
    ['n ghb'] = '<cmd>Gitsigns blame_line<CR>',
    ['n ghd'] = '<cmd>Gitsigns diffthis<CR>'
  }
}
