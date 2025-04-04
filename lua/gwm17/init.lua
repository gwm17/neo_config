require("gwm17.keymaps")
require("gwm17.settings")
require("gwm17.lazy_init")

local gwm_group = vim.api.nvim_create_augroup("gwm17", {})
local autocmd = vim.api.nvim_create_autocmd

-- Setup default LSP behavior
vim.lsp.config("*", {
	capabilities = { textDocument = { semanticTokens = { multilineTokenSupport = true } } },
	root_markers = { ".git" },
})

-- Enable LSPs
vim.lsp.enable({ "rust_analyzer", "pyright", "ruff", "clangd", "lua_ls" })

-- LSP keymaps on a per buffer basis
autocmd("LSPAttach", {
	group = gwm_group,
	callback = function(e)
		local opts = { buffer = e.buf }
		local wk = require("which-key")

		wk.add({
			{
				"gd",
				function()
					vim.lsp.buf.definition()
				end,
				desc = "LSP GoTo Defintion",
				mode = "n",
				opts,
			},
			{
				"K",
				function()
					vim.lsp.buf.hover()
				end,
				desc = "LSP Hover Hint",
				mode = "n",
				opts,
			},
			{
				"<leader>vws",
				function()
					vim.lsp.buf.workspace_symbol()
				end,
				desc = "LSP Workspace Symbol",
				mode = "n",
				opts,
			},
			{
				"<leader>vd",
				function()
					vim.lsp.buf.open_float()
				end,
				desc = "LSP Open Float",
				mode = "n",
				opts,
			},
			{
				"<leader>vca",
				function()
					vim.lsp.buf.code_action()
				end,
				desc = "LSP Code Action",
				mode = "n",
				opts,
			},
			{
				"<leader>vrr",
				function()
					vim.lsp.buf.references()
				end,
				desc = "LSP Highlight References",
				mode = "n",
				opts,
			},
			{
				"<leader>vrn",
				function()
					vim.lsp.buf.rename()
				end,
				desc = "LSP Rename",
				mode = "n",
				opts,
			},
			{
				"<C-h>",
				function()
					vim.lsp.buf.signature_help()
				end,
				desc = "LSP Signature help",
				mode = "i",
				opts,
			},
			{
				"[d",
				function()
					vim.lsp.buf.goto_next()
				end,
				desc = "LSP GoTo next",
				mode = "n",
				opts,
			},
			{
				"]d",
				function()
					vim.lsp.buf.goto_previous()
				end,
				desc = "LSP GoTo previous",
				mode = "n",
				opts,
			},
		})
	end,
})
