return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
	},
	config = function()
		local servers = {
			clangd = {},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
			pyright = {},
			snyk_ls = {},
			tailwindcss = {},
			ts_ls = {},
			vimls = {},
			yamlls = {},
		}
		for server, opts in pairs(servers) do
			vim.lsp.config(server, opts)
		end
		vim.lsp.enable(vim.tbl_keys(servers))
	end,
}
