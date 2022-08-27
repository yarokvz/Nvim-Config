local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local gps = require("nvim-gps")

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info" },
	symbols = { error = " ", warn = " ", info="" },
	colored = true,
	update_in_insert = true,
	always_visible = false,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
	colored = true
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
	colored = true,
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

vim.opt.laststatus = 3

if gps.is_available then
	print(gps.get_location)
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = false,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { diagnostics },
		lualine_c = {
			{
				'filename',
				file_status = true,
				path = 0,
				shorting_target = 40,
				symbols = {
					modified = '  ',
					readonly = '  ',
					unnamed = 'unnamed'
				},
				{ gps.get_location, cond = gps.is_available }
			--	'buffers',
			--	show_modified_status = true,
				--show_filename_only = true,
				--icons_enabled = false
			}
		},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { branch, filetype },--"fileformat"},
	--	lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
	-- Lua
})
vim.opt.laststatus = 3
