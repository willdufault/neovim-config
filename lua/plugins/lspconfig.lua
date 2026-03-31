return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
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
    "hrsh7th/cmp-nvim-lsp",
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
              "!Ref",
              "!Ref mapping",
              "!Sub",
              "!Sub sequence",
              "!GetAtt",
              "!GetAtt sequence",
              "!FindInMap sequence",
              "!And sequence",
              "!Or sequence",
              "!Not sequence",
              "!If sequence",
              "!Equals sequence",
              "!Join sequence",
              "!Split sequence",
              "!ImportValue",
            },
          },
        },
      },
    }

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    for server, opts in pairs(servers) do
      opts.capabilities = capabilities
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
