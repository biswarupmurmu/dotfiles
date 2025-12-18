return {
	{
		"navarasu/onedark.nvim",
		priority = 1000,

		-- config = function()
		-- 	require("onedark").setup({
		-- 		style = "deep",
		-- 		transparent = true,
		-- 	})
		-- 	require("onedark").load()
		-- end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 999,
		opts = {transparent = true},
		config = function ()
			vim.cmd[[colorscheme tokyonight-moon]]
		end
	}
}
