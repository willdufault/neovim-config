return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					["*"] = { "prettier" },
					c = { "clang-format" },
					lua = { "stylua" },
					python = { "black", "isort" },
				},
			})
			vim.keymap.set("n", "<leader>f", function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end)
		end,
	},
}
