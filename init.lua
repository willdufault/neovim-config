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

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.opt.timeoutlen = 500
vim.opt.updatetime = 300

vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- Globals
vim.g.netrw_banner = 0
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Keymaps
local function map(mode, left, right)
	local opts = { noremap = true, silent = true }
	vim.keymap.set(mode, left, right, opts)
end

map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>wq", ":wq<CR>")
map({ "n", "v" }, "<leader>d", '"_d<CR>')
map("n", "<leader>n", ":enew<CR>")
map("n", "<leader>e", ":Ex<CR>")

map("n", "<C-u>", "10kzz")
map("n", "<C-d>", "10jzz")

map("n", "<leader>bn", ":bn<CR>")
map("n", "<leader>bp", ":bp<CR>")
map("n", "<leader>bd", ":bd<CR>")

map("n", "<leader>s", ":vsplit<CR>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Color scheme
vim.pack.add({
	{ src = "https://github.com/olimorris/onedarkpro.nvim" },
})
vim.cmd.colorscheme("vaporwave")

-- Language servers
vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
})
require("mason").setup()

vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
vim.lsp.enable({
	"lua_ls",
	"pyright",
	"snyk_ls",
	"tailwindcss",
	"ts_ls",
	"vimls",
	"yamlls",
})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	severity_sort = true,
})

-- Fuzzy finder
vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Syntax highlighting & folding
vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
	},
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "lua", "python", "typescript", "vim" },
	callback = function()
		vim.treesitter.start()
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo.foldlevel = 99
	end,
})

-- Formatter
vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})
local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "isort" },
		["*"] = { "prettier" },
	},
})

map("n", "<leader>f", function()
	conform.format({ async = true })
end)

-- Comments
vim.pack.add({
	{ src = "https://github.com/tpope/vim-commentary" },
})
