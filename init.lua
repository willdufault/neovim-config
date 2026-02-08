-- Options
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.colorcolumn = "80"
vim.o.signcolumn = "yes"
vim.o.scrolloff = 5

vim.o.termguicolors = true
vim.o.background = "dark"

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.linebreak = true
vim.o.breakindent = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = false

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.laststatus = 3

vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.confirm = true

vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"

vim.o.timeoutlen = 300
vim.o.updatetime = 300

-- Globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_banner = 0
vim.g.have_nerd_font = true

-- Diagnostics
vim.diagnostic.config({
	update_in_insert = false,
	signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    }
  },
	severity_sort = true,
	virtual_text = true,
	underline = { severity = vim.diagnostic.severity.ERROR },
	jump = { float = true },
})

-- Keymaps
local function keymap(mode, left, right)
	local opts = { noremap = true, silent = true }
	vim.keymap.set(mode, left, right, opts)
end

keymap({ "n", "v" }, "<leader>d", '"_d<CR>')
keymap("n", "<leader>n", ":enew<CR>")
keymap("n", "<leader>e", ":Ex<CR>")

keymap("n", "<C-u>", "10kzz")
keymap("n", "<C-d>", "10jzz")

keymap("n", "<leader>s", ":vsplit<CR>")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

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
	"clangd",
	"lua_ls",
	"pyright",
	"snyk_ls",
	"tailwindcss",
	"ts_ls",
	"vimls",
	"yamlls",
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

-- Syntax highlighting
vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
	},
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "javascript", "lua", "python", "typescript", "vim" },
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
		["*"] = { "prettier" },
		c = { "clang-format" },
		lua = { "stylua" },
		python = { "black", "isort" },
	},
})

keymap("n", "<leader>f", function()
	conform.format({ async = true })
end)

-- Comments
vim.pack.add({
	{ src = "https://github.com/tpope/vim-commentary" },
})
