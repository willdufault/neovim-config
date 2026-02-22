-- Set before Lazy setup to ensure correct keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.preferences")
require("config.autocommands")
require("config.lazy")
require("config.keymaps")
