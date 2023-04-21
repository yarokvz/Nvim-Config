-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
    return
end

require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "lua", "rust", "python", "javascript", "java", "json", "html" },
    highlight = {
        enable = true, -- false will disable the whole extension
    },
    sync_install = false,

    -- incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --         init_selection = 'gnn',
    --         node_incremental = 'grn',
    --         scope_incremental = 'grc',
    --         node_decremental = 'grm',
    --     },
    -- },
    rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
            "Gold",
            "Orchid",
            "DodgerBlue"
        },
        disable = { "html" }
    },
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

    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    auto_install = true,
    additional_vim_regex_highlighting = false,
}
