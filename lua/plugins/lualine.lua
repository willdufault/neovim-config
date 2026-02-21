return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      sections = {
        -- Show full path
        lualine_c = { { "filename", path = 2 } },
      },
    },
  },
}
