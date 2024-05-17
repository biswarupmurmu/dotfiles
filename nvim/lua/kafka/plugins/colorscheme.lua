return {
    {
        "navarasu/onedark.nvim",
        priority = 1000,

        config = function()
            require("onedark").setup({
                style = "deep",
                transparent = true,
            })
            require("onedark").load()
        end,
    },
}
