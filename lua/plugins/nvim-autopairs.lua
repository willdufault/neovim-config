return {
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = true,
    opts = {
      ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
    },
  },
}
