local M = {
	"nvim-lualine/lualine.nvim",
	-- commit = "0050b308552e45f7128f399886c86afefc3eb988",
	event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
	dependencies = {
		{
			"LazyVim/LazyVim",
		},
		{
			"MunifTanjim/nui.nvim",
			lazy = true,
		},
	},
}

function M.config()
	local status_ok, lualine = pcall(require, "lualine")
	if not status_ok then
		return
	end
	local Util = require("lazyvim.util")

	local hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end

	local diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		sections = { "error", "warn", "info" },
		symbols = { error = " ", warn = " ", info = " " },
		update_in_insert = true,
		colored = true,
		always_visible = true,
	}

	local lsp_name = {
		function()
			local msg = "No Active Lsp"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
			return msg
		end,
		icon = " LSP:",
		color = { fg = "#777d80", gui = "italic" },
	}
	--
	-- local diff = {
	-- 	"diff",
	-- 	colored = false,
	-- 	symbols = { added = " ", modified = " " }, -- changes diff symbols
	-- 	cond = hide_in_width,
	-- }

	local filetype = {
		"filetype",
		icons_enabled = true,
		icon_only = true,
		icon = nil,
		colored = true,
	}

	local searchcount = {
		"searchcount",
		maxcount = 999,
		timeout = 500,
	}

	local mode = {
		"mode",
		fmt = function(str)
			return "-- " .. str .. " --"
		end,
	}

	local branch = {
		"branch",
		icons_enabled = true,
		icon = "",
		colored = true,
	}

	--local location = {
	--  "location",
	--  padding = 0,
	--}

	-- local spaces = function()
	--   return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
	-- end

	lualine.setup({
		options = {
			globalstatus = true,
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha", "dashboard", "neo-tree", "Outline", "Telescope", "jabs" },
			always_divide_middle = false,
			extensions = { "neo-tree", "lazy" },
		},
		sections = {
			lualine_a = { branch },
			lualine_b = { diagnostics },
			lualine_c = {
				filetype,
				{
					"filename",
					file_status = true,
					path = 0,
					shorting_target = 40,
					symbols = {
						modified = "  ",
						readonly = "  ",
						unnamed = "unnamed",
					},
				},
			},
			lualine_x = {
				lsp_name,
			}, --spaces, "encoding", filetype },
			lualine_y = {
				searchcount,
				"filesize",
				"progress",
			},
			lualine_z = { mode },
		},
	})
	vim.opt.laststatus = 3
end

return M
