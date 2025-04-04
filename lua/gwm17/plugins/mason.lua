return {
	-- Use nvim-lspconfig and friends
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
	},

	config = function()
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
