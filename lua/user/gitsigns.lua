return {
	"lewis6991/gitsigns.nvim",
	-- commit = "ec4742a7eebf68bec663041d359b95637242b5c3",
	event = "BufReadPre",
	opts = {
		-- require("gitsigns").setup({
		-- signs = {
		-- 	-- add = { hl = "GitSignsAdd", text = icons.git.Add, numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		-- 	-- change = { hl = "GitSignsChange", text = icons.git.Mod, numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		-- 	add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		-- 	change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		-- 	delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		-- 	topdelete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		-- 	changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		-- },
		-- signs_staged = {
		-- 	add = { hl = "GitSignsStagedAdd", text = "▎", numhl = "GitSignsStagedAddNr", linehl = "GitSignsStagedAddLn" },
		-- 	change = { hl = "GitSignsStagedChange", text = "▎", numhl = "GitSignsStagedChangeNr", linehl = "GitSignsStagedChangeLn" },
		-- 	delete = { hl = "GitSignsStaqedDelete", text = "▎", numhl = "GitSignsStagedDeleteNr", linehl = "GitSignsStagedDeleteLn" },
		-- 	topdelete = { hl = "GitSignsStagedDelete", text = "▎", numhl = "GitSignsStagedDeleteNr", linehl = "GitSignsStagedDeleteLn" },
		-- 	changedelete = { hl = "GitSignsStagedChange", text = "▎", numhl = "GitSignsStagedChangeNr", linehl = "GitSignsStagedChangeLn" },
		-- },
		signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
		numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
		-- linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		-- word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		current_line_blame = true,
		attach_to_untracked = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
		},
		-- current_line_blame_formatter_opts = { "<author>, <author_time:%Y-%m-%d> - <summary>" },
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000,
		preview_config = {
			-- Options passed to nvim_open_win
			border = "single",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 2,
		},
		-- })

	},
	dependencies = {
		{
			"tpope/vim-fugitive", -- Git commands in nvim
			lazy = false,
		},
		{
			"tpope/vim-rhubarb",
			lazy = true,
		},
	},
}
