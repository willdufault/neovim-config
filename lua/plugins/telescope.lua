return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function(args)
    local function map(left, right, opts)
      opts = opts or {}
      vim.keymap.set("n", left, right, opts)
    end

    local builtin = require("telescope.builtin")
    map("<leader>sf", builtin.find_files)
    map("<leader>sg", builtin.live_grep)
    map("<leader>sb", builtin.buffers)
    map("<leader>sh", builtin.help_tags)
    map("<leader>ss", builtin.lsp_document_symbols, { buffer = args.buf })
  end,
}
