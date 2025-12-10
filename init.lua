-- // Mapping Leader Keys // --
vim.g.mapleader       = " "
vim.g.maplocalleader  = "\\"

-- // Options // --

-- Cursor and Line options
vim.o.cursorline      = true
vim.o.number          = true
vim.o.relativenumber  = true
vim.o.scrolloff       = 8

-- Tabs options
vim.o.shiftwidth      = 2
vim.o.tabstop         = 2
vim.o.softtabstop     = 2
vim.o.expandtab       = true -- Use spaces instead of tabs

-- Color options
vim.o.termguicolors   = true

-- // Requirements // --
require("calebesouzas")
