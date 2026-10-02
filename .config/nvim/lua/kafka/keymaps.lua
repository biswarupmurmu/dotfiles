vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "move line down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "move line up" })
vim.keymap.set("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "move line down" })
vim.keymap.set("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "move block down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "move block up" })

vim.keymap.set("n", "<leader>p", "<cmd>bp<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>n", "<cmd>bn<CR>", { desc = "Go to next buffer" })

vim.keymap.set("n", "<leader>tw", function()
    local current_config = vim.diagnostic.config()
    vim.diagnostic.config({
        virtual_text = not current_config.virtual_text
    })
end, { desc = "[T]oggle [W]arning Text" })
