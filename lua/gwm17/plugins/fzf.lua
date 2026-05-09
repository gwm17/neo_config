return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
        {
            "<leader>ff",
            function()
                require("fzf-lua").files()
            end,
            desc = "fzf search for files"
        },
        {
            "<leader>fo",
            function()
                require("fzf-lua").oldfiles()
            end,
            desc = "fzf search for recently used files"
        },
        {
            "<leader>fb",
            function()
                require("fzf-lua").buffers()
            end,
            desc = "fzf search for buffers",
        },
        {
            "<leader>fg",
            function()
                require("fzf-lua").grep()
            end,
            desc = "fzf grep",
        },
        {
            "<leader>fw",
            function()
                require("fzf-lua").grep_cword()
            end,
            desc = "fzf grep current word",
        },
        {
            "<leader>fW",
            function()
                require("fzf-lua").grep_cWORD()
            end,
            desc = "fzf grep current WORD",
        },
        {
            "<leader>/",
            function()
                require("fzf-lua").lgrep_curbuf()
            end,
            desc = "fzf live-grep current buffer"
        },
        {
            "<leader>gd",
            function()
                require("fzf-lua").lsp_definitions()
            end,
            desc = "fzf LSP goto definitions"
        },
        {
            "<leader>gD",
            function()
                require("fzf-lua").lsp_declarations()
            end,
            desc = "fzf LSP goto declaration"
        },
        {
            "<leader>gr",
            function()
                require("fzf-lua").lsp_references()
            end,
            desc = "fzf LSP goto references"
        },
        {
            "<leader>gi",
            function()
                require("fzf-lua").lsp_implementations()
            end,
            desc = "fzf LSP goto implementation"
        },
    }
}
