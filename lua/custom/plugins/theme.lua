return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      transparent = true,
      styles = { sidebars = 'transparent', floats = 'transparent' },
    },
    config = function(_, opts)
      vim.o.termguicolors = true
      require('tokyonight').setup(opts)
      vim.cmd.colorscheme 'tokyonight-moon'
      vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#3b3f51' })
      vim.api.nvim_set_hl(0, 'CursorLineNr', { bold = true })
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = true,
    config = function()
      require('catppuccin').setup {
        flavour = 'frappe',
        background = { light = 'latte', dark = 'mocha' },
        transparent_background = true,
        float = { transparent = true, solid = false },
        show_end_of_buffer = false,
        term_colors = false,
        dim_inactive = { enabled = false, shade = 'dark', percentage = 0.15 },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
          comments = { 'italic' },
          conditionals = { 'italic' },
        },
        lsp_styles = {
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
            ok = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
            ok = { 'underline' },
          },
          inlay_hints = { background = true },
        },
        default_integrations = true,
        auto_integrations = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          notify = false,
          mini = { enabled = true, indentscope_color = '' },
        },
      }
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = true,
    config = function()
      require('gruvbox').setup { transparent_mode = true }
    end,
  },
  {
    'navarasu/onedark.nvim',
    lazy = true,
    config = function()
      require('onedark').setup { style = 'darker', transparent = true }
    end,
  },
  {
    'sainnhe/everforest',
    lazy = true,
    config = function()
      vim.g.everforest_background = 'hard'
      vim.g.everforest_transparent_background = 1
    end,
  },
}

