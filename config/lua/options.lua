-- MAP LEADER
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Wrapping & UI
opt.winborder = "single"
opt.wrap = false
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.fillchars = { eob = " ", }

-- Show cmdline when entering command-line mode
local cmdheightDefault = 0
local cmdheightOpen = 1
local augroup = vim.api.nvim_create_augroup("DynamicCmdHeight", { clear = true })
vim.api.nvim_create_autocmd({"CmdlineEnter"}, { group = augroup, callback = function() vim.o.cmdheight = cmdheightOpen end, })
vim.api.nvim_create_autocmd("CmdlineLeave", { group = augroup, callback = function() vim.o.cmdheight = cmdheightDefault end, })
opt.cmdheight = cmdheightDefault

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Behavior
opt.backspace = "indent,eol,start"
opt.clipboard = "unnamedplus"
opt.splitright = true
opt.splitbelow = true
opt.swapfile = false
opt.confirm = true

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldcolumn = "auto"
