return {
  {
    "olimorris/codecompanion.nvim",
    version = "^18.0.0",
    keys = {
      {
        "<leader>i",
        ":CodeCompanion<CR>",
        mode = "v",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      interactions = {
        inline = {
          keymaps = {
            accept_change = {
              modes = { n = "ga" },
            },
            reject_change = {
              modes = { n = "gr" },
              opts = { nowait = true },
            },
            stop = {
              modes = { n = "q" },
              index = 4,
              callback = "keymaps.stop",
            },
          },
        },
      },
    },
  },
}
