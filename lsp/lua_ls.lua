return {
	cmd = { "lua-language-server" },
	root_markers = { "init.lua" },
	filetypes = { "lua" },
	settings = {
		Lua = {
			runtime = { version = "Lua 5.4" },
			diagnostics = {
				globals = { "vim", "describe" },
			},
		},
	},
}
