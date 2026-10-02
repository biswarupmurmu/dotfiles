return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "j-hui/fidget.nvim", opts = {} },
    },

    config = function()
        -- 1. Setup Capabilities (for nvim-cmp)
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        -- 2. Setup Keymaps via LspAttach Autocommand
        -- This automatically runs whenever an LSP attaches to a buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP keybindings',
            callback = function(event)
                local bufnr = event.buf
                local nmap = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. (desc or "") })
                end

                nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

                nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				nmap("gl", vim.diagnostic.open_float, "Show Error Float")

                nmap("K", vim.lsp.buf.hover, "Hover Documentation")
                nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

                nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
            end,
        })

        -- 3. Configure Specific Servers (Overrides)
        -- We only need to do this for servers where you aren't using the default settings
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })

        -- 4. Enable All Servers and Attach Capabilities
        local servers = {
            "lua_ls", "clangd", "emmet_ls", "cssls", "html", 
            "tailwindcss", "ts_ls", "eslint", "pyright", 
            "bashls", "rust_analyzer", "astro"
        }

        for _, server in ipairs(servers) do
            -- Inject your nvim-cmp capabilities into the native config
            vim.lsp.config(server, { capabilities = capabilities })
            
            -- Actually start the server
            vim.lsp.enable(server)
        end
    end,
}
