local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local icons = require "own_config.icons"
local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
	sort_by = "case_sensitive",
	--disable_netrw = true,
	--hijack_netrw = true,
	--open_on_setup = false,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	renderer = {
		add_trailing = false,
		group_empty = true,
		highlight_git = false,
		highlight_opened_files = "icon",
		root_folder_modifier = ":t",
		indent_markers = {
			enable = true,
		},
		icons = {
			webdev_colors = true,
			git_placement = "after",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = icons.ui.ArrowOpen,
					arrow_closed = icons.ui.ArrowClosed,
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	--	auto_close = true,
	--open_on_tab = true,
	--hijack_cursor = true,
	update_cwd = true,
	--update_to_buf_dir = {
	--	enable = true,
	--	auto_open = true,
	--},
	diagnostics = {
		enable = true,
		icons = {
			hint = icons.diagnostics.Hint,
			info = icons.diagnostics.Information,
			warning = icons.diagnostics.Warning,
			error = icons.diagnostics.Error,
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	--system_open = {
	--	cmd = nil,
	--	args = {},
	--},
	--filters = {
	--	dotfiles = false,
	--	custom = {},
	--},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		adaptive_size = true,
		side = "left",
		--auto_resize = true,
		mappings = {
			custom_only = false,
			list = {
				--{ key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
				{ key = "h", cb = tree_cb "close_node" },
				{ key = "v", cb = tree_cb "vsplit" },
			},
		},
		number = false,
		relativenumber = false,
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	--	quit_on_open = 0,
	--	git_hl = 1,
	--	disable_window_picker = 0,
	--	root_folder_modifier = ":t",
	--	show_icons = {
	--		git = 1,
	--		folders = 1,
	--		files = 1,
	--		folder_arrows = 1,
	--		tree_width = 10,
	--	},
}
