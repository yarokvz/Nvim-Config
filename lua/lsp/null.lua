local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    sources = {
        --formatting.prettier.with({
        --	extra_filetypes = { "toml", "solidity" },
        --	extra_args = { "--no-semi", "--jsx-single-quote" },
        --}),
        --formatting.black.with({ extra_args = { "--fast" } }),
        --formatting.stylua,
        --formatting.shfmt,
        formatting.autopep8,
        formatting.clang_format.with({
            extra_args = { "--length", row_offset = -2 }
        })
        --formatting.google_java_format,
        -- diagnostics.flake8,
    },
    -- you can reuse a shared lspconfig on_attach callback here
    -- on_attach = function(client, bufnr)
    --     if client.supports_method("textDocument/formatting") then
    --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --         vim.api.nvim_create_autocmd("BufWritePre", {
    --             group = augroup,
    --             buffer = bufnr,
    --             callback = function()
    --                 -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    --                 vim.lsp.buf.format({ bufnr = bufnr })
    --             end,
    --         })
    --     end
    -- end,
})
