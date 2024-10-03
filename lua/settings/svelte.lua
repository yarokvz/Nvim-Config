return {
	settings = {
		Svelte = {
			filetypes = "svelte",
			cmd = { "svelteserver", "--stdio" },
			root_dir = root_pattern("package.json", ".git"),
		},
	},
}
