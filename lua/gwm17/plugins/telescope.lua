return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("telescope").setup({})
		local builtin = require("telescope.builtin")
		local wk = require("which-key")
		wk.add({
			{ "<leader>ff", builtin.find_files, mode = "n", desc = "Telescope find files" },
			{ "<leader>gi", builtin.git_files, mode = "n", desc = "Telescope find git files" },
			{ "<leader>fg", builtin.live_grep, mode = "n", desc = "Telescope live grep" },
			{ "<leader>fb", builtin.buffers, mode = "n", desc = "Telescope buffers" },
			{ "<leader>fh", builtin.help_tags, mode = "n", desc = "Telescope help tags" },
			{
				"<leader>fws",
				function()
					local word = vim.fn.expand("<cword>")
					builtin.grep_string({ search = word })
				end,
				mode = "n",
				desc = "Telescope search for current word",
			},
			{
				"<leader>fWs",
				function()
					local word = vim.fn.expand("<cWORD>")
					builtin.grep_string({ search = word })
				end,
				mode = "n",
				desc = "Telescope search for current WORD",
			},
		})
	end,
}
