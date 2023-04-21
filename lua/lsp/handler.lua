local servers = {
    -- "cssls",
    "html",
    -- "tailwindcss",
    "tsserver",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    -- "sumneko_lua",
    "rust_analyzer",
}

local icons = require "own_config.icons"

local signs = {
    { name = "DiagnosticSignError", text = icons.diagnostics.Error },
    { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
    { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
    { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
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

vim.diagnostic.config(configs)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'gn', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workleader_folder, bufopts)
    -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workleader_folder, bufopts)
    -- vim.keymap.set('n', '<leader>wl', function()
    --     print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
    -- end, bufopts)
    vim.keymap.set('n', '<leader>d', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- local lsp_flags = {
--     -- This is the default in Nvim 0.7+
--     debounce_text_changes = 150,
-- }

vim.cmd [[
	augroup format_on_save
		autocmd!
		autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })
	augroup end
]]
for _, server in pairs(servers) do
    require('lspconfig')[server].setup {
        on_attach = on_attach,
        -- flags = lsp_flags
    }
end
-- require("lspconfig").emmet_ls.setup({
--     -- on_attach = on_attach,
--     capabilities = capabilities,
--     on_attach = on_attach,
--     filetypes = { 'html', 'css', 'sass', 'scss', 'less' },
--     init_options = {
--         html = {
--             options = {
--                 -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--                 ["bem.enabled"] = true,
--             },
--         },
--     }
-- })
-- require('lspconfig')['pyright'].setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }
-- require('lspconfig')['tsserver'].setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }
-- require('lspconfig')['rust_analyzer'].setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     -- Server-specific settings...
--     settings = {
--         ["rust-analyzer"] = {}
--     }
-- }
