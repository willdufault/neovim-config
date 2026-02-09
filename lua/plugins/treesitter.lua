return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local filetypes = {
				"bash",
				"c",
				"diff",
				"html",
        "javascript",
        "json",
        "jsx",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
        "python",
				"query",
        "toml",
        "tsx",
        "typescript",
				"vim",
				"vimdoc",
        "yaml",
			}
			require("nvim-treesitter").install(filetypes)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = filetypes,
				callback = function()
					-- Enable syntax highlighting
					vim.treesitter.start()

					-- Enable smart folding
					vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo[0][0].foldmethod = "expr"
					vim.wo[0][0].foldlevel = 99

					-- Enable smart indentation
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
