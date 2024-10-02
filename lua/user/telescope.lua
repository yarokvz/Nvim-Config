local M = {
	"nvim-telescope/telescope.nvim",
	-- commit = "203bf5609137600d73e8ed82703d6b0e320a5f36",
	event = "Bufenter",
	cmd = { "Telescope" },
	dependencies = {
		{
			"ahmedkhalf/project.nvim",
			-- commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
		},
	},
}

M.opts = {
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },
	},
}

return M
