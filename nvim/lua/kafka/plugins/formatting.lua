return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				cpp = { "clang_format" },
				c = { "clang_format" },
				rust = { "rustfmt" },
				htmldjango = { "prettier", "djlint" },
			},
			-- format_on_save = {
			-- 	lsp_fallback = true,
			-- 	async = false,
			-- 	timeout_ms = 1000,
			-- },
			formatters = {
				prettier = {
					prepend_args = { "--tab-width", 4 },
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			local success = conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 1000,
			})
			local fidget = require("fidget")
			if success then
				fidget.notify("File formatted 󰸞")
			else
				fidget.notify("File format failed", vim.log.levels.ERROR, { annote = "File format failed" })
			end
		end, { desc = "format file or selection" })
	end,
}
