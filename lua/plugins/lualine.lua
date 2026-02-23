return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      sections = {
        lualine_c = { { "filename", path = 2 } },
        lualine_x = { "filetype" },
      },
    },
  },
}
