return {
	cmd = { "pyright-langserver", "--stdio" },
	root_markers = { "pyproject.toml", "requirements.txt", "Pipfile", "setup.py" },
	filetypes = { "python" },
	settings = {
		pyright = {
			disableOrganizeImports = true,
			disableTaggedHints = true,
		},
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "off",
				typeCheckingMode = "basic",
				useLibraryCodeForTypes = true,
			},
		},
	},
}
