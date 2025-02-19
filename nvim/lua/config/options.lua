vim.opt.mouse = 'a'
vim.opt.wrap = false
vim.opt.hidden = true
vim.opt.ignorecase = false
vim.opt.smartcase = true
vim.opt.confirm = true

vim.opt.clipboard = "unnamedplus"

vim.opt.completeopt = {"menu", "menuone", "noselect"}

vim.opt.termguicolors = true
vim.opt.cursorline = false
vim.opt.laststatus = 3
vim.opt.cmdheight = 2
vim.opt.number = true
vim.opt.signcolumn = "yes"

vim.opt.expandtab = true
vim.opt.smartindent = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2

vim.opt.cursorline = true

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldlevel = 4

