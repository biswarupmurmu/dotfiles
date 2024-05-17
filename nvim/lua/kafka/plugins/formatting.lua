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
            -- formatters = {
            -- 	prettier = {
            -- 		prepend_args = { "--tab-width", 4 },
            -- 	},
            -- },
        })

        vim.keymap.set({ "n", "v" }, "<leader>fm", function()
            conform.format({
                lsp_fallback = true,
                async = true,
                timeout_ms = 1000,
            })
        end, { desc = "Format" })
        require("which-key").register({
            ["<leader>f"] = { name = "[F]ormat", _ = "which_key_ignore" },
        })
    end,
}
