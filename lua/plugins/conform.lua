return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
  config = function()
    require("conform").setup({
      formatters = {
        prettier = {
          append_args = {
            "--no-semi",
            "--trailing-comma=none",
          },
        },
        stylua = {
          append_args = {
            "--indent-type=Spaces",
            "--indent-width=2",
            "--column-width=80",
          },
        },
      },
      formatters_by_ft = {
        c = { "clang-format" },
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "ruff_format" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        yaml = { "prettier" },
      },
    })
    vim.keymap.set("n", "<leader>f", function()
      require("conform").format({ async = true, lsp_format = "fallback" })
    end)
  end,
}
