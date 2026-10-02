return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
	spec = {
			{ "<leader>g", group = "[G]it" },
			{ "<leader>w", group = "[W]orkspace" },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>c", group = "[C]ode" },
--[[ 			{ desc = "", hidden = true, mode = { "n", "n", "n", "n", "n", "n", "n" } }, ]]
		}

  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
dependencies = { 'echasnovski/mini.icons', version = false }
}
