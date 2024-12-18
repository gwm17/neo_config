return {
	{
		"folke/trouble.nvim",
		config = function()
			local trouble = require("trouble")
			local wk = require("which-key")
			trouble.setup({})

			wk.add({
				{
					"<leader>tt",
					function()
						trouble.toggle("diagnostics")
					end,
					desc = "Trouble Toggle",
					mode = "n",
				},
				{
					"[t",
					function()
						require("trouble").next({ skip_groups = true, jump = true })
					end,
					desc = "Trouble Next issue",
					mode = "n",
				},
				{
					"]t",
					function()
						require("trouble").previous({ skip_groups = true, jump = true })
					end,
					desc = "Trouble Previous issue",
					mode = "n",
				},
			})
		end,
	},
}
