-- return {
-- 	"yamatsum/nvim-cursorline",
-- 	event = { "BufReadPost", "BufNewFile" },
-- 	--lazy = true,
-- 	opts = {
-- 		cursorline = {
-- 			enable = true,
-- 			timeout = 50,
-- 			number = true,
-- 		},
-- 		cursorword = {
-- 			enable = true,
-- 			min_length = 2,
-- 			hl = { underline = true },
-- 			-- hl_underline = true,
-- 		},
-- 	},
-- }

local M = {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
}
-- 	config = function(_, opts)
-- 		require("illuminate").configure(opts)
--
-- 		local function map(key, dir, buffer)
-- 			vim.keymap.set("n", key, function()
-- 				require("illuminate")["goto_" .. dir .. "_reference"](false)
-- 			end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
-- 		end
--
-- 		map("<A-n>", "next")
-- 		map("<A-p>", "prev")
--
-- 		-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
-- 		vim.api.nvim_create_autocmd("FileType", {
-- 			callback = function()
-- 				local buffer = vim.api.nvim_get_current_buf()
-- 				map("]]", "next", buffer)
-- 				map("[[", "prev", buffer)
-- 			end,
-- 		})
-- 	end,
-- 	keys = {
-- 		{ "<A-n>", desc = "Next Reference" },
-- 		{ "<A-p>", desc = "Prev Reference" },
-- 	},

function M.config()
	local illuminate = require("illuminate")
	illuminate.configure({
		filetypes_denylist = {
			"mason",
			"harpoon",
			"DressingInput",
			"NeogitCommitMessage",
			"NeoTree",
			"qf",
			"dirvish",
			"oil",
			"minifiles",
			"fugitive",
			"alpha",
			"NvimTree",
			"lazy",
			"NeogitStatus",
			"Trouble",
			"netrw",
			"lir",
			"DiffviewFiles",
			"Outline",
			"Jaq",
			"spectre_panel",
			"toggleterm",
			"DressingSelect",
			"TelescopePrompt",
		},
		-- 		delay = 100,
		-- 		large_file_cutoff = 2000,
		-- 		large_file_overrides = {
		-- 			providers = { "lsp" },
		-- 		},
		-- vim.cmd([[
		-- 	augroup illuminate_augroup
		-- 		autocmd!
		-- 		autocmd VimEnter * hi link illuminatedWord CursorLine
		-- 	augroup END
		-- 	]]),
		vim.cmd([[
			augroup illuminate_augroup
				autocmd!
				autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
			augroup END
			]]),
	})
end

return M
