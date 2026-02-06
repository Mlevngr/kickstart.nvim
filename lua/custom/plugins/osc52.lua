return {
  'ojroques/nvim-osc52',
  lazy = false,
  config = function()
    local function executable(cmd)
      return vim.fn.executable(cmd) == 1
    end

    local has_display = (vim.env.DISPLAY ~= nil and vim.env.DISPLAY ~= '') and executable 'xclip'

    local osc52 = require 'osc52'
    osc52.setup { silent = true }

    if has_display then
      vim.g.clipboard = {
        name = 'xclip',
        copy = {
          ['+'] = 'xclip -selection clipboard',
          ['*'] = 'xclip -selection primary',
        },
        paste = {
          ['+'] = 'xclip -selection clipboard -o',
          ['*'] = 'xclip -selection primary -o',
        },
      }
    else
      local function copy(lines, _)
        osc52.copy(table.concat(lines, '\n'))
      end

      local function paste()
        return { vim.split(vim.fn.getreg '+', '\n'), vim.fn.getregtype '+' }
      end

      vim.g.clipboard = {
        name = 'osc52',
        copy = { ['+'] = copy, ['*'] = copy },
        paste = { ['+'] = paste, ['*'] = paste },
      }
    end

    vim.keymap.set('n', '<leader>y', osc52.copy_operator, { expr = true, desc = 'OSC52 yank (operator)' })
    vim.keymap.set('n', '<leader>yy', '<leader>y_', { remap = true, desc = 'OSC52 yank line' })
    vim.keymap.set('v', '<leader>y', osc52.copy_visual, { desc = 'OSC52 yank (visual)' })
  end,
}
