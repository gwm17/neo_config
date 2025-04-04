return {
	-- Use nvim-lspconfig and friends
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
		"j-hui/fidget.nvim",
	},

	config = function()
		-- Grab the functionality of cmp & lsp to give to mason
		local blink = require("blink.cmp")
		local capabilities = blink.get_lsp_capabilities() 

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
				"ruff", -- For linting, formatting, etc.
				"bashls",
			},
			handlers = {
				-- Default behavior
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.4" },
								diagnostics = {
									globals = { "vim", "describe" },
								},
							},
						},
					})
				end,
				-- Disable pyright linting and formatting
				["pyright"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.pyright.setup({
						capabilities = capabilities,
						settings = {
							pyright = {
								disableOrganizeImports = true,
								disableTaggedHints = true,
							},
							python = {
								analysis = {
									diagnosticMode = "off",
									typeCheckingMode = "basic",
								},
							},
						},
					})
				end,
			},
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
