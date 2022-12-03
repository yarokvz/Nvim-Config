-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "lua", "rust", "python", "javascript", "java", "json", "html" },
    highlight = {
        enable = true, -- false will disable the whole extension
    },
    -- incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --         init_selection = 'gnn',
    --         node_incremental = 'grn',
    --         scope_incremental = 'grc',
    --         node_decremental = 'grm',
    --     },
    -- },
    -- rainbow = {
    --     enable = true,
    --     extended_mode = false,
    --     colors = {
    --         "Gold",
    --         "Orchid",
    --         "DodgerBlue"
    --     },
    --     disable = { "html" }
    -- },
    playground = {
        enable = true
    },
    indent = {
        enable = true,
        disable = { "css" }
    },
    autopairs = {
        enable = true,
    },
    auto_install = true,
}
