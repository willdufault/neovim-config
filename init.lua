-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"

vim.opt.scroll = 10
vim.opt.scrolloff = 5

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.timeoutlen = 500

-- Globals
vim.g.netrw_banner = 0

-- Color scheme
vim.cmd.colorscheme("catppuccin")

-- Keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

function map(mode, left, right)
    local opts = { noremap = true, silent = true }
    vim.keymap.set(mode, left, right, opts)
end

map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>wq", ":wq<CR>")
map("n", "<leader>n", ":enew<CR>")
map("n", "<leader>e", ":Ex<CR>")
map("n", "<leader>f", "mmggVG=`mzz") -- TODO: replace with real formatter

map("n", "<leader>bn", ":bn<CR>")
map("n", "<leader>bp", ":bp<CR>")
map("n", "<leader>bd", ":bd<CR>")
map("n", "<leader>bl", ":buffers<CR>")

map("n", "<leader>s", ":vsplit<CR>")
map("n", "<leader>c", ":close<CR>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
