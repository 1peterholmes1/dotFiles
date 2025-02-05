-- vim.keymap.set("n", "<leader>e", '<Cmd>Ex<CR>', { silent = true })

-- Move chunks up and down when selected in linewise visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Not sure
vim.keymap.set("n", "J", ",zJ`z")

-- Paste from system clipboard
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

-- Disable Q from doing anything because I hit it a lot
vim.keymap.set("n", "Q", "<nop>")

-- Save and exit easier
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Splits
vim.keymap.set("n", "|", '<Cmd>vsplit<CR>')
vim.keymap.set("n", "\\", '<Cmd>split<CR>')

-- Unhighlight search when escape is pressed
vim.keymap.set("n", "<Esc>", "<Cmd>noh<CR>")

-- Go back to previous file
vim.keymap.set("n", "<leader>bb", "<C-^>")

-- Jump between quickfixes
vim.keymap.set('n', ']q', '<Cmd>cn<CR>')
vim.keymap.set('n', '[q', '<Cmd>cp<CR>')
