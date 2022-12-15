local status_ok, jabs = pcall(require, "jabs")
if not status_ok then
    return
end

local ui = vim.api.nvim_list_uis()[1]

jabs.setup {
    position = 'center', -- center, corner
    width = 50,
    height = 10,
    border = 'rounded', -- none, single, double, rounded, solid, shadow, (or an array or chars)

    -- Options for preview window
    preview_position = 'left', -- top, bottom, left, right
    highlight = {
        current = "Title", -- default StatusLine
        hidden = "StatusLineNC", -- default ModeMsg
        split = "WarningMsg", -- default StatusLine
        alternate = "StatusLine" -- default WarningMsg
    },
    keymap = {
        close = "d", -- Close buffer. Default D
        h_split = "h", -- Horizontally split buffer. Default s
        v_split = "v", -- Vertically split buffer. Default v
        preview = "p", -- Open buffer preview. Default P
    },
    preview = {
        width = 40,
        height = 30,
        border = 'double', -- none, single, double, rounded, solid, shadow, (or an array or chars)
    },
    use_devicons = true,
    -- the options below are ignored when position = 'center'
    col = ui.width, -- Window appears on the right
    row = ui.height / 2, -- Window appears in the vertical middle
}
