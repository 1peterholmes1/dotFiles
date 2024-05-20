-- vim.keymap.set("n", "<leader>e", '<Cmd>Ex<CR>', { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", ",zJ`z")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

vim.keymap.set("n", "|", '<Cmd>vsplit<CR>')
vim.keymap.set("n", "\\", '<Cmd>split<CR>')

vim.keymap.set("n", "<leader>nh", "<Cmd>noh<CR>")

vim.keymap.set("n", "<leader>gb", "<C-^>")
