local function keymap(mode, left, right)
	local opts = { noremap = true, silent = true }
	vim.keymap.set(mode, left, right, opts)
end

keymap({ "n", "v" }, "<leader>d", '"_d<CR>')
keymap("n", "<leader>n", ":enew<CR>")
keymap("n", "<leader>e", ":Ex<CR>")

keymap("n", "<C-u>", "10kzz")
keymap("n", "<C-d>", "10jzz")

keymap("n", "<leader>s", ":vsplit<CR>")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
