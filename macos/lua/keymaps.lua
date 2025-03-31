-- space bar leader key
vim.g.mapleader = " "

-- buffer line
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")

-- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- macOS
-- vim.api.nvim_set_keymap('i', '48;56;212;1064;1908', '', { noremap = true, silent = true })

