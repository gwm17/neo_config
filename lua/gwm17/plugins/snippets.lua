return {
    "L3MON4D3/LuaSnip",
    tag = "v2.3.0", -- Latest release

    -- Add some keybindings
    config = function()
        local snips = require("luasnip")
        vim.keymap.set({ "i" }, "<C-s>e", function() snips.expand() end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-s>;", function() snips.jump(1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-s>,", function() snips.jump(-1) end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-E>", function()
            if snips.choice_active() then
                snips.change_choice(1)
            end
        end, { silent = true })
    end
}
