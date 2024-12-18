return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gs = require("gitsigns")
					local wk = require("which-key")

					wk.add({
						{
							"]c",
							function()
								if vim.wo.diff then
									vim.cmd.normal({ "]c", bang = true })
								else
									gs.nav_hunk("next")
								end
							end,
							desc = "Gitsigns Next hunk",
							mode = "n",
						},
						{
							"[c",
							function()
								if vim.wo.diff then
									vim.cmd.normal({ "[c", bang = true })
								else
									gs.nav_hunk("prev")
								end
							end,
							desc = "Gitsigns Prev hunk",
							mode = "n",
						},
						{ "<leader>hs", gs.stage_hunk, desc = "Gitsigns stage hunk", mode = "n" },
						{ "<leader>hr", gs.reset_hunk, desc = "Gitsigns reset hunk", mode = "n" },
						{ "<leader>hu", gs.undo_stage_hunk, desc = "Gitsigns undo stage hunk", mode = "n" },
						{ "<leader>hp", gs.preview_hunk, desc = "Gitsigns preview hunk", mode = "n" },
						{ "<leader>hd", gs.diffthis, desc = "Gitsigns diff this", mode = "n" },
						{ "<leader>hS", gs.stage_buffer, desc = "Gitsigns stage buffer", mode = "n" },
						{ "<leader>hR", gs.reset_buffer, desc = "Gitsigns reset buffer", mode = "n" },
						{
							"<leader>hD",
							function()
								gs.diffthis("~")
							end,
							desc = "Gitsigns diff all",
							mode = "n",
						},
					})
				end,
			})
		end,
	},
}
