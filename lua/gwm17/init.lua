require("gwm17.keymaps")
require("gwm17.settings")
require("gwm17.lazy_init")

local gwm_group = vim.api.nvim_create_augroup("gwm17", {})
local autocmd = vim.api.nvim_create_autocmd

-- LSP keymaps, cause I guess they don't really exist?
autocmd("LSPAttach", {
    group = gwm_group,
    callback = function(e)
        local opts = { buffer = e.buf }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.lsp.buf.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.lsp.buf.goto_previous() end, opts)
    end
})
