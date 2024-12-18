return {
	"L3MON4D3/LuaSnip",
	tag = "v2.3.0", -- Latest release

	-- Add some keybindings
	config = function()
		local snips = require("luasnip")
		local wk = require("which-key")
		wk.add({
			{
				"<C-s>e",
				function()
					snips.expand()
				end,
				desc = "LuaSnip Expand",
				mode = { "i" },
				{ silent = true },
			},

			{
				"<C-s>;",
				function()
					snips.jump(1)
				end,
				desc = "LuaSnip jump forward",
				mode = { "i", "s" },
				{ silent = true },
			},
			{
				"<C-s>,",
				function()
					snips.jump(-1)
				end,
				desc = "LuaSnip jump forward",
				mode = { "i", "s" },
				{ silent = true },
			},

			{
				"<C-E>",
				function()
					if snips.choice_active() then
						snips.change_choice(1)
					end
				end,
				desc = "LuaSnip change choice",
				mode = { "i", "s" },
				{ silent = true },
			},
		})
	end,
}
