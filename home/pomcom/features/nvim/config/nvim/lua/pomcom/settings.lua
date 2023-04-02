-- General
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.wrap = true
vim.o.swapfile = false

-- Tab rules
local indent = 2
vim.o.tabstop = indent
vim.o.softtabstop = indent
vim.o.shiftwidth = indent
vim.o.expandtab = true	            -- use spaces for tabs

-- Indent
vim.o.autoindent = true
vim.o.smartindent = true	          -- autoindent on newline

-- Theme
vim.o.termguicolors = true          -- true color support
vim.o.background = 'dark'           -- light theme is for criminals
vim.cmd [[colorscheme tokyonight ]]
-- vim.cmd [[colorscheme zenbones ]]   -- make it zen

vim.o.splitright = true             -- open vertical split on right
vim.o.splitbelow = true             -- open horizontal split below
