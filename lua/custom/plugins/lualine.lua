return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function()
    local function lineinfo()
      local line = vim.fn.line '.'
      local total_row = vim.fn.line '$'
      local col = vim.fn.virtcol '.'
      local total_col = vim.fn.strdisplaywidth(vim.fn.getline '.')
      return string.format('%d/%d:%d/%d', line, total_row, col, total_col)
    end

    return {
      options = {
        theme = 'onedark',
        globalstatus = true,
        section_separators = '',
        component_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { lineinfo },
      },
    }
  end,
}

