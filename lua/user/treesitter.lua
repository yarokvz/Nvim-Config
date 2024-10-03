local M = {
	"nvim-treesitter/nvim-treesitter",
	-- commit = "226c1475a46a2ef6d840af9caa0117a439465500",
	event = "BufReadPost",
	build = ":TSUpdate",
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
			-- commit = "729d83ecb990dc2b30272833c213cc6d49ed5214",
		},
		{
			"nvim-tree/nvim-web-devicons",
			event = "VeryLazy",
			-- commit = "0568104bf8d0c3ab16395433fcc5c1638efc25d4",
		},
		{
			"nvim-treesitter/nvim-treesitter-refactor",
			event = "BufReadPost",
		},
		-- {
		-- 	"tpope/vim-liquid",
		-- 	event = "BufReadPost",
		-- },
	},
}
function M.config()
	-- require("ts_context_commentstring").setup(
	--    )
	local treesitter = require("nvim-treesitter")
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "rust", "javascript", "svelte" }, -- put the language you want in this array
		-- ensure_installed = "all", -- one of "all" or a list of languages
		ignore_install = { "" },                                                                                 -- List of parsers to ignore installing
		sync_install = false,                                                                                    -- install languages synchronously (only applied to `ensure_installed`)
		highlight = {
			enable = true,                                                                                       -- false will disable the whole extension
			disable = {},                                                                                        -- list of language that will be disabled
		},
		autopairs = {
			enable = true,
		},
		indent = { enable = true, disable = { "python", "css" } },
		matchup = {
			enable = { "astro" },
			disable = { "lua" },
		},
		context_commentstring = {
			-- vim.g.skip_ts_context_commentstring_module = true,
			-- enable = true,
			-- enable_autocmd = false,
		},
		refactor = {
			smart_rename = {
				enable = true,
				-- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
				keymaps = {
					smart_rename = "grr",
				},
			},
			highlight_current_scope = { enable = false },
			highlight_definitions = {
				enable = true,
				-- Set to false if you have an `updatetime` of ~100.
				clear_on_cursor_move = true,
			},
			navigation = {
				enable = true,
				-- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
				keymaps = {
					goto_definition = "gnd",
					list_definitions = "gnD",
					list_definitions_toc = "gO",
					goto_next_usage = "<a-n>",
					goto_previous_usage = "<a-p>",
				},
			},
		},
	})
end

return M
