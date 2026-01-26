vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = True

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'systemverilog', 'verilog' },
  callback = function()
    vim.bo.commentstring = '// %s'
  end,
})
