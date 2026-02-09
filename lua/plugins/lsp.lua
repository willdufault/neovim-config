return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
	},
	config = function()
		local servers = {
			clangd = {},
      jsonls = {},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
              -- Ignore global vim warning
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
			yamlls = {
				settings = {
					yaml = {
						-- AWS Cloudformation tags
						customTags = {
							"!Base64",
							"!Cidr",
							"!And",
							"!Equals",
							"!If",
							"!Not",
							"!Or",
							"!FindInMap",
							"!ForEach",
							"!GetAtt",
							"!GetAZs",
							"!ImportValue",
							"!Join",
							"!Length",
							"!Select",
							"!Split",
							"!Sub",
							"!ToJsonString",
							"!Transform",
							"!Ref",
							"!Contains",
							"!EachMemberEquals",
							"!EachMemberIn",
							"!RefAll",
							"!ValueOf",
							"!ValueOfAll",
						},
					},
				},
			},
		}
		for server, opts in pairs(servers) do
			vim.lsp.config(server, opts)
		end
		vim.lsp.enable(vim.tbl_keys(servers))
	end,
}
