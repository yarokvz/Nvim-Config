return {
	settings = {
		Astro = {
			cmd = {
				"astro-ls",
				"--stdio",
				"lsp",
			},
			-- on_attach = require('completion').on_attach,
			filetypes = "astro",
			init_options = {
				typescript = {},
			},
			-- root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
		},
	},
}
