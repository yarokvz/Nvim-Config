local navic = require("nvim-navic")
-- local icons = require "own_config.icons"

require("lspconfig").clangd.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
require("lspconfig").sumneko_lua.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
require("lspconfig").tsserver.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
require("lspconfig").pyright.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
require("lspconfig").rust_analyzer.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}

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
    highlight             = false,
    -- separator             = " > ",
    depth_limit           = 0,
    depth_limit_indicator = "..",
})
