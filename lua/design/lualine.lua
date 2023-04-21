local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local navic = require("nvim-navic")
local wpm = require("wpm")


local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn", "info" },
    symbols = { error = " ", warn = " ", info = "" },
    colored = true,
    update_in_insert = true,
    always_visible = false,
}

local diff = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width
}

local mode = {
    "mode",
    fmt = function(str)
        return "-- " .. str .. " --"
    end,
}

local filetype = {
    "filetype",
    icons_enabled = true,
    icon_only = true,
    icon = nil,
    colored = true
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
    colored = true,
}


-- local location = {
--     "location",
--     padding = 0,
-- }

-- local spaces = function()
--     return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "onedark", --"tokyonight"
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "Telescope", "jabs" },
        always_divide_middle = false,
    },
    sections = {
        lualine_a = { branch },
        lualine_b = { diagnostics },
        lualine_c = {
            filetype,
            {
                "filename",
                file_status = true,
                path = 0,
                shorting_target = 40,
                symbols = {
                    modified = '  ',
                    readonly = '  ',
                    unnamed = 'unnamed'
                },
                --	'buffers',
                --	show_modified_status = true,
                --show_filename_only = true,
                --icons_enabled = false
            },
            {
                navic.get_location,
                cond = navic.is_available
            },
        },
        -- lualine_x = { "encoding", "fileformat", "filetype" },
        -- lualine_x = {}, --"fileformat"},
        lualine_x = { wpm.wpm,
            wpm.historic_graph,
            require('pomodoro').statusline
        },
        --lualine_y = { navic_func },--, cond = navic.is_available },
        lualine_y = { "progress" },
        lualine_z = { mode }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        --lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
    },
    tabline = {},
    extensions = {},
    -- Lua
})
vim.opt.laststatus = 3
