-- Keymaps

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Open terminal in a horizontal split
vim.keymap.set('n', '<leader>tt', function()
  vim.cmd 'split'
  vim.cmd 'resize 12'
  vim.cmd 'terminal'
  vim.cmd 'startinsert'
end, { desc = 'Open terminal (bottom split)' })

-- Open terminal in a vertical split
vim.keymap.set('n', '<leader>tv', function()
  vim.cmd 'vsplit'
  vim.cmd 'terminal'
  vim.cmd 'startinsert'
end, { desc = 'Open terminal (vertical split)' })

-- Exit terminal mode in the builtin terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Split navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

