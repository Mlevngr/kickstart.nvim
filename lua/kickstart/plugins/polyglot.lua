-- lua/custom/plugins/polyglot.lua
return {
  {
    'sheerun/vim-polyglot',
    lazy = false,
    init = function()
      -- Work around E495 from polyglot hooks using <afile> in unnamed buffers.
      vim.g.polyglot_disabled = vim.list_extend(vim.g.polyglot_disabled or {}, { 'autoindent', 'ftdetect' })
    end,
  },
}
