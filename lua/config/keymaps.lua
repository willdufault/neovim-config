local function map(mode, left, right)
	local opts = { noremap = true, silent = true }
	vim.keymap.set(mode, left, right, opts)
end

map({ "n", "v" }, "<leader>d", '"_d<CR>')
map("n", "<leader>n", ":enew<CR>")
map("n", "<leader>e", ":Ex<CR>")

map({ "n", "v" }, "<C-u>", "10kzz")
map({ "n", "v" }, "<C-d>", "10jzz")

map("n", "<leader>s", ":vsplit<CR>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Copy absolute path to clipboard
map("n", "<leader>cp", function()
	vim.fn.setreg("+", vim.fn.expand("%:p"))
end)
