return {
  'Pocco81/auto-save.nvim',
  lazy = false,
  opts = {
    debounce_delay = 500,
    execution_message = {
      message = function()
        return ''
      end,
    },
  },
  keys = {
    { '<leader>u', '<cmd>ASToggle<CR>', desc = 'Toggle autosave' },
  },
}
