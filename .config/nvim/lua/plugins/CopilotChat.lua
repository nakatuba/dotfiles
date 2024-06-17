return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    'github/copilot.vim',
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local config = require('CopilotChat.config')
    local select = require('CopilotChat.select')

    require('CopilotChat').setup {
      debug = true,
      auto_insert_mode = true,
      selection = function(source)
        return select.visual(source) or select.buffer(source)
      end,
      prompts = {
        Explain = {
          prompt = config.prompts.Explain.prompt .. ' Please answer in Japanese.'
        },
        Review = {
          prompt = config.prompts.Review.prompt .. ' Please answer in Japanese.'
        },
        Fix = {
          prompt = config.prompts.Fix.prompt .. ' Please answer in Japanese.'
        },
        Optimize = {
          prompt = config.prompts.Optimize.prompt .. ' Please answer in Japanese.'
        },
        Docs = {
          prompt = config.prompts.Docs.prompt .. ' Please answer in Japanese.'
        },
        Tests = {
          prompt = config.prompts.Tests.prompt .. ' Please answer in Japanese.'
        },
        FixDiagnostic = {
          prompt = config.prompts.FixDiagnostic.prompt .. ' Please answer in Japanese.'
        },
        Commit = {
          prompt = config.prompts.Commit.prompt .. ' Please answer in Japanese.'
        },
        CommitStaged = {
          prompt = config.prompts.CommitStaged.prompt .. ' Please answer in Japanese.'
        }
      },
      window = {
        layout = 'float'
      },
      mappings = {
        close = {
          normal = '<Esc>',
        },
        submit_prompt = {
          insert = '<C-CR>'
        }
      }
    }

    require('CopilotChat.integrations.cmp').setup()

    vim.keymap.set({'n', 'x', 'i'}, '<C-/>', '<cmd>CopilotChatToggle<CR>')
  end,
  branch = 'canary'
}
