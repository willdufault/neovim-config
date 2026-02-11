return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function(args)
		local function map(left, right, opts)
			opts = opts or {}
			vim.keymap.set("n", left, right, opts)
		end

		local builtin = require("telescope.builtin")
		map("<leader>ff", builtin.find_files)
		map("<leader>fg", builtin.live_grep)
		map("<leader>fb", builtin.buffers)
		map("<leader>fh", builtin.help_tags)
		map("<leader>fs", builtin.lsp_document_symbols, { buffer = args.buf })
	end,
}
