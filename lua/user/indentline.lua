return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		require("ibl").setup({
			exclude = {
				filetypes = {
					"help",
					"startify",
					"dashboard",
					"lazy",
					"neogitstatus",
					"NvimTree",
					"Trouble",
					"text",
				},
			},
			debounce = 100,
			indent = {
				char = "|",
			},
			whitespace = {
				highlight = { "Function", "Label" },
				remove_blankline_trail = true,
			},
			scope = {
				enabled = true,
				show_start = true,
				show_end = true,
				injected_languages = true,
				-- highlight = { "Function", "Label" },
				priority = 500,
			},
			-- show_trailing_blankline_indent = false,
			-- show_first_indent_level = true,
			-- -- use_treesitter = true,
			-- show_current_context = true,
		})
	end,
}
