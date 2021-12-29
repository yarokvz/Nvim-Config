local options={
	inccommand = 'nosplit', --incremental live completion(note: this is now default on master)
	hlsearch = false, --Set highlight on search
	number = true, --line numbers by default
	hidden = true, --Do not save when switching buffers(note: this is now default on master)
	mouse = 'a', --enable mouse mode
	breakindent = true, -- Enable breakindent
	undofile = true, --save undo history
	 --Case insensitive searching UNLESS /C or capital search
	ignorecase = true,
	smartcase = true,
	--Decrease update time
	updatetime = 250,
	signcolumn = 'yes',
}

--set colorscheme (order important)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd [[colorscheme onedark]]

--Set statusbar
vim.g.lightline = {
	colorscheme = 'onedark',
	active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
	component_function = { gitbranch = 'fugitive#head' },
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

