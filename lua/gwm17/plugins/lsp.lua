return {
    -- Use nvim-lspconfig and friends
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
    },

    config = function()
        require("lspconfig")
        -- Custom configuration of lsps
        -- Define vim and describe to lua_ls
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = { version = "Lua 5.4" },
                    diagnostics = { globals = { "vim", "describe" } },
                },
            }
        })

        -- Pyright only for autocomplete, etc
        vim.lsp.config("pyright", {
            settings = {
                pyright = {
                    disableOrganizeImports = true,
                    disableTaggedHints = true,
                },
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "off",
                        typeCheckingMode = "basic",
                        useLibraryCodeForTypes = true,
                    },
                },
            },
        })

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            -- The installed servers
            ensure_installed = {
                "rust_analyzer",
                "clangd",
                "cmake",
                "lua_ls",
                "pyright", -- For completion, hover, etc.
                "ruff",    -- For linting, formatting, etc.
                "bashls",
            },
            automatic_enable = true
        })

        -- Idk exactly what this does ...
        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}
