return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers',
        numbers = 'ordinal',
        diagnostics = 'nvim_lsp',

        -- keep the modified mark visible and avoid overlap
        modified_icon = '●',
        show_buffer_close_icons = false,
        show_close_icon = false,

        indicator = { style = 'icon', icon = '▎' },
        separator_style = 'slant',
        always_show_bufferline = true,

        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
      highlights = {
        -- make modified mark stand out on the active buffer
        modified_selected = { bold = true },
        indicator_selected = { fg = '#89b4fa' },
        separator = {
          fg = '#3b3f56',
          bg = 'NONE',
        },
        separator_selected = {
          fg = '#3b3f56',
          bg = 'NONE',
        },
        separator_visible = {
          fg = '#3b3f56',
          bg = 'NONE',
        },
      },
    }

    -- keymaps
    vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
    vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Prev buffer' })
    vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete current buffer' })
  end,
}
