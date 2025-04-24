return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- 图标支持
  },
  event = 'VeryLazy', -- 启动后自动加载
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- 显示 buffer（还可以是 tabs）
        numbers = 'ordinal', -- 显示编号
        diagnostics = 'nvim_lsp', -- 显示 LSP 诊断
        show_buffer_close_icons = true,
        show_close_icon = true,
        separator_style = 'slant', -- 分隔符样式："slant", "thick", "thin"
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
    }

    vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
    vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Prev buffer' })
    vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete current buffer' })
  end,
}
