return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter").install({
			"vimdoc",
			"python",
			"rust",
			"c",
			"cpp",
			"lua",
			"javascript",
			"typescript",
			"json",
			"toml",
			"markdown",
			"bash",
		})
	end,
}
