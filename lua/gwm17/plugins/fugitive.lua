return {
	"tpope/vim-fugitive",

	config = function()
		local wk = require("which-key")
		wk.add({ { "<leader>gt", vim.cmd.Git, desc = "Fugitive Open Git", mode = "n" } })
	end,
}
