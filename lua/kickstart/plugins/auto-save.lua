return {
  'Pocco81/auto-save.nvim',
  event = 'InsertLeave',
  opts = {
    enabled = false,
    debounce_delay = 500,
    trigger_events = { 'InsertLeave' },
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
