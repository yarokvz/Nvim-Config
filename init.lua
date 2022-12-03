-- Highlight on yank
vim.cmd [[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
require('onedark').setup {
    style = 'darker'
}
--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }

-- personal config
require "own_config.keymaps"
require "filesystem_config.nvtree"
require "design.alpha"
require "plugins.plugins"
require "own_config.settings"
require "parser.treesitter"
require "lsp"
require "cmp.cmp"
require "cmp.autopairs"
require "term.toggleterm"
require "design.gitsigns"
require "design.lualine"
require "filesystem_config.telescope"
require "design.colorizer"
require "design.navic"
--require "yaro.gps"
require "design.illuminate"
require "filesystem_config.jabs"
require "own_config.REST"
-- require "own_config.whichkey"
-- require "functions"
--require "design.winbar"
--require "yaro.lsp.init"
