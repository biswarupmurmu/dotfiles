-- return {
--     "nvim-treesitter/nvim-treesitter",
--     event = { "BufReadPre", "BufNewFile" },
--     build = ":TSUpdate",
--     dependencies = {
--         "nvim-treesitter/nvim-treesitter-textobjects",
--     },
--     config = function()
--         local treesitter = require("nvim-treesitter.configs")
--
--         treesitter.setup({
--
--             ensure_installed = {
--                 "c",
--                 "cpp",
--                 "go",
--                 "lua",
--                 "python",
--                 "rust",
--                 "tsx",
--                 "javascript",
--                 "typescript",
--                 "vimdoc",
--                 "vim",
--                 "bash",
--             },
--
--             auto_install = true,
--             ignore_install = { "htmldjango" },
--             disable = { "htmldjango", "html" },
--
--             highlight = { enable = true },
--             indent = { enable = true },
--             incremental_selection = {
--                 enable = true,
--                 keymaps = {
--                     init_selection = "<c-space>",
--                     node_incremental = "<c-space>",
--                     scope_incremental = "<c-space>",
--                     node_decremental = "<M-space>",
--                 },
--             },
--             textobjects = {
--                 select = {
--                     enable = true,
--                     lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
--                     keymaps = {
--                         -- You can use the capture groups defined in textobjects.scm
--                         ["aa"] = "@parameter.outer",
--                         ["ia"] = "@parameter.inner",
--                         ["af"] = "@function.outer",
--                         ["if"] = "@function.inner",
--                         ["ac"] = "@class.outer",
--                         ["ic"] = "@class.inner",
--                     },
--                 },
--                 move = {
--                     enable = true,
--                     set_jumps = true, -- whether to set jumps in the jumplist
--                     goto_next_start = {
--                         ["]m"] = "@function.outer",
--                         ["]]"] = "@class.outer",
--                     },
--                     goto_next_end = {
--                         ["]M"] = "@function.outer",
--                         ["]["] = "@class.outer",
--                     },
--                     goto_previous_start = {
--                         ["[m"] = "@function.outer",
--                         ["[["] = "@class.outer",
--                     },
--                     goto_previous_end = {
--                         ["[M"] = "@function.outer",
--                         ["[]"] = "@class.outer",
--                     },
--                 },
--                 swap = {
--                     enable = true,
--                     swap_next = {
--                         ["<leader>a"] = "@parameter.inner",
--                     },
--                     swap_previous = {
--                         ["<leader>A"] = "@parameter.inner",
--                     },
--                 },
--             },
--         })
--     end,
-- }


return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    -- Note: textobjects is temporarily commented out. 
    -- The textobjects plugin still relies on the old API and is currently 
    -- broken on the new `main` branch until the community updates it.
    -- dependencies = {
    --     "nvim-treesitter/nvim-treesitter-textobjects",
    -- },
    
    config = function()
        -- 1. Native Highlighting & Indentation (The New Way)
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                -- Enable Neovim's native treesitter syntax highlighting
                pcall(vim.treesitter.start)
                -- Enable treesitter-based indentation
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })

        -- 2. Auto-Install Parsers (ensure_installed is deprecated)
        local ensure_installed = {
            "c", "cpp", "go", "lua", "python", "rust", "tsx", 
            "javascript", "typescript", "vimdoc", "vim", "bash"
        }
        
        -- Filter out already installed parsers to prevent redundant installs on startup
        local already_installed = require("nvim-treesitter.config").get_installed()
        local parsers_to_install = vim.iter(ensure_installed)
            :filter(function(parser) return not vim.tbl_contains(already_installed, parser) end)
            :totable()
            
        if #parsers_to_install > 0 then
            require("nvim-treesitter").install(parsers_to_install)
        end
    end,
}
