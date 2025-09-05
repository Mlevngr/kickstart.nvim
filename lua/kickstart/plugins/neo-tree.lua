-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    window = {
      position = 'left',
      width = 30,
    },
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['u'] = 'navigate_up',
          ['.'] = 'toggle_hidden',
          ['R'] = 'refresh',
          ['a'] = 'add',
          ['d'] = 'delete',
          ['r'] = 'rename',
        },
      },
      filesystem = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    event_handlers = {
      event = 'neo_tree_buffer_enter',
      handler = function()
        vim.cmd 'setlocal modifiable'
      end,
    },
    follow_current_file = {
      enabled = true,
    },
    use_libuv_file_watcher = true,
  },
}
