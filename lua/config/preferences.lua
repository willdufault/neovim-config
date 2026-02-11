-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 5

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.laststatus = 3

vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.confirm = true

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.opt.timeoutlen = 500
vim.opt.updatetime = 300

-- Globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "nomodifiable nomodified readonly nobuflisted number"

-- Diagnostics
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
	update_in_insert = false,
	severity_sort = true,
	virtual_text = true,
	underline = { severity = vim.diagnostic.severity.ERROR },
	jump = { float = true },
	float = { border = "rounded" },
})
