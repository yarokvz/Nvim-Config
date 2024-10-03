return {
	Css = {
		settings = {
			filetypes = { "css" },
			cmd = { "vscode-css-language-server", "--stdio" },
			init_options = {
				provideFormatter = true
			},
			root_dir = root_pattern("package.json", ".git") or bufdir
		}
	}
}
