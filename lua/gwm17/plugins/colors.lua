return {
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         require("tokyonight").setup(
    --             {
    --                 style = "night",
    --                 terminal_colors = "true",
    --             }
    --         )
    --         vim.cmd.colorscheme("tokyonight")
    --     end
    -- }
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        name = "catppuccin",
        opts = {},
        config = function()
            require("catppuccin").setup({
                flavor = "mocha",
                auto_integrations = true,
            })
            vim.cmd.colorscheme("catppuccin")
        end
    }
}
