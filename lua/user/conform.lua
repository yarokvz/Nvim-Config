return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- Use a sub-list to run only the first available formatter
			javascript = { { "prettierd", "prettier" } },
			cpp = { "astgrep" },
			c = { "astgrep" },
			go = { "gofumpt" },
			rust = { "astgrep" },
			cs = { "astgrep" },
			yaml = { "yamlfmt" }
		},
	},
}

-- local M = {
-- 	"jose-elias-alvarez/null-ls.nvim",
-- 	event = "BufReadPre",
-- }
--
-- function M.config()
-- 	local null_ls = require("null-ls")
-- 	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- 	local formatting = null_ls.builtins.formatting
-- 	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- 	-- local diagnostics = null_ls.builtins.diagnostics
--
-- 	-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- 	null_ls.setup({
-- 		debug = false,
-- 		sources = {
-- 			formatting.stylua,
-- 			formatting.autopep8,
-- 			-- formatting.clang_format.with({
-- 			-- 	extra_args = { "--length", row_offset = -2 },
-- 			-- }),
-- 			formatting.prettier,
-- 		},
-- 	})
-- end
--
-- return M
