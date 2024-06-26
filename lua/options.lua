-- Contains the custom options for VIm Editor

-- Disable VIm file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Tab setting
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Leader key
vim.g.mapleader = " "

-- Line number
vim.wo.relativenumber = true

-- Terminal
vim.opt.termguicolors = true

-- Mouse
vim.opt.mousemoveevent = true
