-- Set before Lazy setup to ensure correct keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.preferences")
require("config.keymaps")
