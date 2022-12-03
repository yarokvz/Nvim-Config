local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

lsp_installer.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}
local servers = {
    "sumneko_lua",
    "pyright",
    "rust_analyzer",
    "pyright",
    "jdtls",
    "tsserver",
    "html",
    "jsonls"
}
for _, server in pairs(servers) do
    opts = {
        on_attach = require("lsp.handlers").on_attach,
        capabilities = require("lsp.handlers").capabilities,
    }
    -- if server == "jsonls" then
    --     local jsonls_opts = require("lsp.settings.jsonls")
    --     opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    -- end

    if server == "sumneko_lua" then
        local sumneko_opts = require("lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    lspconfig[server].setup(opts)
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- lsp_installer.on_server_ready(function(server)
--     local opts = {
--         on_attach = require("lsp.handlers").on_attach,
--         capabilities = require("lsp.handlers").capabilities,
--     }

--     --     server:setup(opts)
-- end)
