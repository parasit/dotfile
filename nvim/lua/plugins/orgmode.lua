vim.pack.add {
  { src = "https://github.com/nvim-orgmode/orgmode", name = 'orgmode' }
}

require('orgmode').setup({
  org_agenda_files = '~/google-drive-bartosz.bubak/org/agendas/**/*.org',
  org_default_notes_file = '~/google-drive-bartosz.bubak/org/agendas/refile.org',
})
