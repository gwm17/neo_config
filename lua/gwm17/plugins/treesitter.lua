return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- Parsers to use
            ensure_installed = {
                "vimdoc", "python", "rust", "c", "cpp", "lua", "javascript",
                "typescript", "json", "toml", "markdown", "bash",
            },

            -- Only for ensured
            sync_install = false,

            -- Auto install if not present on opening file
            auto_install = true,

            indent = { enable = true },

            highlight = {
                enable = true,

            }

        })
    end
}
