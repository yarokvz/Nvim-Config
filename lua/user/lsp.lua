local M = {
	"neovim/nvim-lspconfig",
	-- commit = "649137cbc53a044bffde36294ce3160cb18f32c7",
	lazy = true,
	dependencies = {
		"folke/neodev.nvim",
		"klimeryk/vim-monkey-c",
	},
	-- 	{
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef",
	-- 	},
	-- },
}

function M.config()
	-- require('java').setup()
	local signs = {
		{ name = "DiagnosticSignError", text = " " },
		{ name = "DiagnosticSignWarn", text = " " },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = " " },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end
	local configs = {
		virtual_text = false,
		virtual_lines = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}
	local lspconfig = require("lspconfig")
	vim.diagnostic.config(configs)

	vim.keymap.set("n", "gl", vim.diagnostic.open_float)
	vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next)
	vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist)

	-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
	M.on_attach = function(client, bufnr)
		-- lsp_keymaps(bufnr)

		if client.supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(bufnr, true)
		end
	end

	function M.common_capabilities()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		return capabilities
	end

	-- local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- capabilities.textDocument.completion.completionItem.snippetSupport = true
	-- capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
			-- local opts = { noremap = true, silent = true }
			local opts = { buffer = ev.buf }
			-- local keymap = vim.api.nvim_buf_set_keymap
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
			vim.keymap.set("n", "<leader>lI", "<cmd>Mason<cr>", opts)
			vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end,
	})

	local on_attach = function(client, bufnr)
		if client.name == "tsserver" then
			client.server_capabilities.documentFormattingProvider = false
		end

		if client.name == "sumneko_lua" then
			client.server_capabilities.documentFormattingProvider = true
		end

		if client.server_capabilities["documentSymbolProvider"] then
			require("nvim-navic").attach(client, bufnr)
		end
		require("illuminate").on_attach(client)
	end

	require("lspconfig").cssmodules_ls.setup({
		settings = {
			CSS = {
				filetypes = "css",
				camelCase = true,
			},
		},
		-- -- provide your on_attach to bind keymappings
		on_attach = on_attach,
		-- -- optionally
		-- init_options = {
		--     camelCase = 'dashes',
		-- },
	})

	--
	for _, server in pairs(require("utils").servers) do
		Opts = {
			on_attach = on_attach,
			capabilites = M.common_capabilities(),
		}

		-- server = vim.split(server, "@")[1]

		local require_ok, conf_opts = pcall(require, "lua.settings." .. server)
		-- local conf_opts = require("settings." .. server)
		if require_ok then
			Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
		end
		if server == "lua_ls" then
			require("neodev").setup({})
		end

		lspconfig[server].setup(Opts)
	end
	vim.cmd([[
        augroup format_on_save
            autocmd!
            autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })
        augroup end
    ]])
	-- })
end

return M
