-- Leader key
vim.g.mapleader = " "

-- Relative numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Base indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Disable line wrap
vim.opt.wrap = false

-- Show search in progress
vim.opt.incsearch = true
-- Ignore case in search
vim.opt.ignorecase = true

-- Better colors
vim.opt.termguicolors = true

-- Lower scroll buffer at top/bottom of screen
vim.opt.scrolloff = 8

-- Enable sign column (for git/diag)
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Swap file autosave
vim.opt.updatetime = 50

-- Disable command line when not in use (I think noice overrides this anyway?)
vim.opt.cmdheight = 0
-- vim.opt.cursorline = true
