-- Highlight on yank
vim.cmd [[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
]]

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- personal config
require "yaro.keymaps"
require "yaro.nvtree"
require "yaro.alpha"
require "yaro.plugins"
require "yaro.settings"
require "yaro.treesitter"
require "yaro.lsp"
require "yaro.cmp"
--require "yaro.telescope"
