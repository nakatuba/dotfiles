return {
  'epwalsh/obsidian.nvim',
  config = function()
    require('obsidian').setup {
      dir = '~/ghq/github.com/nakatuba/notes',
      disable_frontmatter = true
    }
  end
}
