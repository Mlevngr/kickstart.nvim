-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    local autopairs = require 'nvim-autopairs'
    autopairs.setup {
      check_ts = true,
      fast_wrap = {},
    }

    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    local npairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'

    npairs.add_rules {
      Rule('\\left(', ' \\right)', 'tex'),
      Rule('\\left[', ' \\right]', 'tex'),
      Rule('\\left\\{', ' \\right\\}', 'tex'),
      Rule('\\big(', ' \\big)', 'tex'),
      Rule('\\Big(', ' \\Big)', 'tex'),
      Rule('\\bigg(', ' \\bigg)', 'tex'),
      Rule('\\Bigg(', ' \\Bigg)', 'tex'),
    }

    npairs.add_rules(require 'nvim-autopairs.rules.endwise-lua')
  end,
}
