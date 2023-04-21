local options = {
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0, -- so that `` is visible in markdown files
    pumheight = 40, -- pop up menu height
    showtabline = 0, -- always show tabs
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set term gui colors (most terminals support this)
    timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    laststatus = 3,
    showcmd = false,
    ruler = false,
    -- scrolloff = 8,                           -- is one of my fav
    guifont = "monospace:h17", -- the font used in graphical neovim applications
    title = true,
    autowrite = true,
    backup = false,
    breakindent = true, -- Enable breakindent
    cmdheight = 1,
    cursorline = true,
    cursorlineopt = "number",
    fileencoding = "utf-8",
    hlsearch = true, --Set highlight on search
    hidden = false, --Do not save when switching buffers(note: this is now default on master)
    ignorecase = true,
    inccommand = 'nosplit', --incremental live completion(note: this is now default on master)
    mouse = 'a', --enable mouse mode
    number = true, --line numbers by default
    numberwidth = 4,
    relativenumber = true,
    scrolloff = 8, -- is one of my fav
    sidescrolloff = 8,
    signcolumn = 'yes',
    shiftwidth = 4,
    showmode = true, -- we don't need to see things like -- INSERT -- anymore
    --Case insensitive searching UNLESS /C or capital search
    smartcase = true,
    smartindent = true, -- make indenting smarter again
    splitbelow = true,
    tabstop = 4,
    undofile = true, --save undo history
    --Decrease update time
    updatetime = 250,
    wrap = false, -- display lines as one long line

    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,
}

--set colorscheme (order important)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]] -- this seem to work
vim.cmd [[colorscheme onedark]]


--Set statusbar
--vim.g.lightline = {
--	colorscheme = 'onedark',
--	active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
--	component_function = { gitbranch = 'fugitive#head' },
--}

for k, v in pairs(options) do
    vim.opt[k] = v
end
