return {
	"nvim-tree/nvim-tree.lua",
	opts = {},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }),
}
