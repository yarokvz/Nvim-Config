local servers = {
    -- "cssls",
    -- "tailwindcss",
    "html",
    "tsserver",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    -- "sumneko_lua",
    "rust_analyzer"
}

local icons = require("own_config.icons")

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = icons.ui.Check,
            package_pending = "◍",
            package_uninstalled = icons.ui.BigUnfilledCircle,
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}
local handler_ok, handler = pcall("handler")
if handler_ok then
    print("handler ok")
end

for _, server in pairs(servers) do
    opts = {
        on_attach = handler.on_attach,
        capabilities = handler.capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "settings." .. server)
    if require_ok then
        opts = vim.tbl_extend("force", conf_opts, opts)
    end

    lspconfig[server].setup(opts)
end
