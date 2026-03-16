return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        require("nvim-treesitter").install({
            "vimdoc", "python", "rust", "c", "cpp", "lua", "javascript",
            "typescript", "json", "toml", "markdown", "bash",
        })
    end
}
