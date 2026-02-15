return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					c = { "clang-format" },
					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					json = { "prettier" },
					lua = { "stylua" },
					python = { "isort", "black" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					yaml = { "prettier" },
				},
			})
			vim.keymap.set("n", "<leader>f", function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end)
		end,
	},
}
