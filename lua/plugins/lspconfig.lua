return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = {
					"clangd",
					"css-lsp", -- css
					"html-lsp", -- html
					"json-lsp", -- jsonls
					"lua-language-server", -- lua_ls
					"pyright",
					"snyk-ls", -- snyk_ls
					"tailwindcss-language-server", -- tailwindcss
					"typescript-language-server", -- ts_ls
					"vim-language-server", -- vimls
					"yaml-language-server", -- yamlls
				},
			},
		},
	},
	config = function()
		local servers = {
			clangd = {},
			css = {},
			html = {},
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

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local function map(left, right)
					vim.keymap.set("n", left, right, { buffer = args.buf })
				end
				map("gd", vim.lsp.buf.definition)
				map("gh", function()
					vim.lsp.buf.hover({ border = "rounded" })
				end)
			end,
		})
	end,
}
