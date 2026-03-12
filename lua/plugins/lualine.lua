return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      sections = {
        lualine_c = { { "filename", path = 2 } },
        lualine_x = { "filetype" },
      },
    },
  },
}
