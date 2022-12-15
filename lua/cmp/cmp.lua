-- Set completeopt to have a better completion experience
-- vim.o.completeopt = 'menuone,noselect'

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

-- local tabnine_status_ok, _ = pcall(require, "lsp.tabnine")
-- if not tabnine_status_ok then
--     return
-- end

-- local compare = require "cmp.config.compare"

-- local buffer_fts = {
--     "markdown",
--     "toml",
--     "yaml",
--     "json",
-- }

--icons for autocompletion
local icons = require "own_config.icons"
local kind_icons = icons.kind

vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })

--vim.g.colorizer_auto_color = 1
--vim.g.colorizer_x11_names = 1
-- vim.g.cmp_active = true

-- nvim-cmp setup
cmp.setup {
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    --keybindings for cmp
    mapping = {
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            --behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = kind_icons[vim_item.kind]
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            if entry.source.name == "emoji" then
                vim_item.kind = icons.misc.Smiley
                vim_item.kind_hl_group = "CmpItemKindEmoji"
            end
            --if entry.source.name == "crates" then
            --    vim_item.kind = icons.misc.Package
            --    vim_item.kind_hl_group = "CmpItemKindCrate"
            --end
            -- This concatonates the icons with the name of the item kind
            -- if entry.source.name == "cmp_tabnine" then
            --     -- menu = entry.completion_item.data.detail .. " " .. menu
            --     -- end
            --     vim_item.kind = icons.misc.Robot
            --     vim_item.kind_hl_group = "CmpItemKindTabnine"
            -- end
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
                -- nvim_lsp = "[lsp]",
                -- nvim_lua = "[lua]",
                -- luasnip = "[snip]",
                -- cmp_tabnine = "[tabnine]",
                -- buffer = "[buff]",
                -- path = "[path]",
                -- emoji = "[emoji]",
            })[entry.source.name]
            return vim_item
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim-lua' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        --{ name = 'cmp_tabnine' },
    },
    sorting = {
        priority_weight = 2,
        -- comparators = {
        --     require('cmp_tabnine.compare'),
        --     compare.offset,
        --     compare.exact,
        --     compare.score,
        --     compare.recently_used,
        --     compare.kind,
        --     compare.sort_text,
        --     compare.length,
        --     compare.order,
        -- },
    },
    window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered()
        -- completion = {
        --     border = "rounded",
        --     winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
        -- },
    },
    experimental = {
        ghost_text = true,
    },
}
