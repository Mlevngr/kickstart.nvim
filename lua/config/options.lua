-- Options

-- Make line numbers default
vim.opt.number = true

-- Window title (kitty)
if vim.env.KITTY_WINDOW_ID then
  vim.opt.title = true
  vim.opt.titlestring = ' %t'
end

-- Enable mouse mode (useful for resizing splits)
vim.opt.mouse = 'a'

-- Set swap file location
vim.opt.directory = vim.fn.expand '~/.local/share/nvim/swap/'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- True color
vim.o.termguicolors = true

-- Sync clipboard between OS and Neovim.
-- Schedule after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = ''
end)

-- Enable virtual edit
vim.opt.virtualedit = 'onemore'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \\C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Whitespace
vim.opt.list = true
vim.opt.listchars = { tab = '| ', trail = '·', nbsp = '␣' }
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = { 'longest:full', 'full' }
