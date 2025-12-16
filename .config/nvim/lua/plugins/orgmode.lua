return {
  'nvim-orgmode/orgmode',
  config = function()
    require('orgmode').setup {
      org_agenda_files = '~/ghq/github.com/nakatuba/org/**/*',
      org_default_notes_file = '~/ghq/github.com/nakatuba/org/notes.org'
    }
  end
}
