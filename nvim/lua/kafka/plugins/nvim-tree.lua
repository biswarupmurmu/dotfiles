return {
	"nvim-tree/nvim-tree.lua",
	opts = {},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }),
}
