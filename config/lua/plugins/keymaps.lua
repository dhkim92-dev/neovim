-- telescope
vim.keymap.set("n", "<leader>fs", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fp", ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>fz", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>")

-- tree
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>")

-- comment
vim.keymap.set("n", "<C-_>", function() 
    require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })
vim.keymap.set("i", "<C-_>", function() 
    require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })
vim.keymap.set("v", "<C-_>", ":lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>", { noremap = true, silent = true })

-- markdown
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<cr>")

-- copilot chat
vim.keymap.set("n", "<leader>zc", ":CopilotChatToggle<cr>")
vim.keymap.set("n", "<leader>zr", ":CopilotChatReset<cr>")
vim.keymap.set("n", "<leader>zm", ":CopilotChatModel<cr>")
vim.keymap.set("v", "<leader>zr", ":CopilotChatReview<cr>")
vim.keymap.set("v", "<leader>ze", ":CopilotChatExplain<cr>")
vim.keymap.set("v", "<leader>zf", ":CopilotChatFix<cr>")
vim.keymap.set("v", "<leader>zt", ":CopilotChatTest<cr>")
vim.keymap.set("v", "<leader>zo", ":CopilotChatOptimize<cr>")
