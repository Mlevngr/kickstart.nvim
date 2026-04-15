-- Autocommands

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Verilog/SystemVerilog commentstring
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'systemverilog', 'verilog' },
  callback = function()
    vim.bo.commentstring = '// %s'
  end,
})

-- Verilog indentation tweak
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'verilog', 'systemverilog' },
  command = 'setlocal indentkeys-==endmodule',
})

-- KDL filetype
vim.filetype.add {
  extension = {
    kdl = 'kdl',
  },
}

-- Fallback filetype detection for KDL (helps if builtin detection misses)
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.kdl', '*.KDL' },
  callback = function()
    if vim.bo.filetype ~= 'kdl' then
      vim.bo.filetype = 'kdl'
    end
  end,
})
