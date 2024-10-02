local M = {
	"SmiteshP/nvim-navic",
	event = { "InsertEnter", "BufAdd", "BufNew", "BufReadPost" },
	dependencies = {
		"neovim/nvim-lspconfig",
		event = { "InsertEnter", "BufAdd", "BufNew", "BufReadPost" },
	},
}

function M.config()
	local navic = require("nvim-navic")
	-- local icons = require "own_config.icons"

	require('lspconfig').jdtls.setup({
		on_attach = function(client, bufnr)
			navic.attach(client, bufnr)
		end,
	})

	require("lspconfig").clangd.setup({
		on_attach = function(client, bufnr)
			navic.attach(client, bufnr)
		end,
	})
	require("lspconfig").lua_ls.setup({
		on_attach = function(client, bufnr)
			navic.attach(client, bufnr)
		end,
	})
	require("lspconfig").ts_ls.setup({
		on_attach = function(client, bufnr)
			navic.attach(client, bufnr)
		end,
	})
	require("lspconfig").pyright.setup({
		on_attach = function(client, bufnr)
			navic.attach(client, bufnr)
		end,
	})
	require("lspconfig").rust_analyzer.setup({
		on_attach = function(client, bufnr)
			navic.attach(client, bufnr)
		end,
	})

	navic.setup({
		-- icons                 = {
		--     File = " ",
		--     Module = " ",
		--     Namespace = " ",
		--     Package = " ",
		--     Class = " ",
		--     Method = " ",
		--     Property = " ",
		--     Field = " ",
		--     Constructor = " ",
		--     Enum = " ",
		--     Interface = " ",
		--     Function = " ",
		--     Variable = " ",
		--     Constant = " ",
		--     String = " ",
		--     Number = " ",
		--     Boolean = " ",
		--     Array = " ",
		--     Object = " ",
		--     Key = " ",
		--     Null = " ",
		--     EnumMember = " ",
		--     Struct = " ",
		--     Event = " ",
		--     Operator = " ",
		--     TypeParameter = " ",
		-- },
		icons = {
			Text = "",
			Method = "m",
			Function = "",
			Constructor = "",
			Field = "",
			Variable = " ",
			Class = "",
			Interface = "",
			Module = "",
			Property = " ",
			Unit = " ",
			Value = "",
			Enum = "",
			Keyword = " ",
			Snippet = "",
			Color = "",
			File = " ",
			Reference = "",
			Folder = "",
			EnumMember = " ",
			Constant = "",
			Struct = "",
			Event = "",
			Operator = " ",
			TypeParameter = "",
			Misc = " ",
		},
		highlight = true,
		-- separator             = " > ",
		depth_limit = 0,
		depth_limit_indicator = "..",
	})
end

return M
