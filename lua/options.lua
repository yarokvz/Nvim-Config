vim.opt.clipboard = "unnamedplus"                       -- allows neovim to access the system clipboard
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                                -- so that `` is visible in markdown files
vim.opt.pumheight = 40                                  -- pop up menu height
vim.opt.showtabline = 0                                 -- always show tabs
vim.opt.splitright = true                               -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                                -- creates a swapfile
vim.opt.termguicolors = true                            -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                               -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.writebackup = false                             -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                                -- convert tabs to spaces
vim.opt.laststatus = 3
vim.opt.showcmd = false
vim.opt.ruler = false
--vim.opt.-- scrolloff = 8                           -- is one of my fav
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.title = true
vim.opt.autowrite = true
vim.opt.backup = false
vim.opt.breakindent = true -- Enable breakindent
vim.opt.cmdheight = 1
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true        --Set highlight on search
vim.opt.hidden = false         --Do not save when switching buffers(note: this is now default on master)
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit" --incremental live completion(note: this is now default on master)
vim.opt.mouse = "a"            --endfble mouse mode
vim.opt.number = true          --line numbers by default
vim.opt.numberwidth = 4
vim.opt.relativenumber = true
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.showmode = true -- we don't need to see things like -- INSERT -- anymore
--vim.opt.--Case insensitive searching UNLESS /C or capital search
vim.opt.smartcase = true
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true
vim.opt.undofile = true    --save undo history
--vim.opt.--Decrease upate time
vim.opt.updatetime = 100
vim.opt.wrap = false -- display lines as one long line
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.smoothscroll = true
-- vim.opt.foldmethod = "indent"

--set colorscheme (order important)
vim.o.termguicolors = true
-- vim.g.onedark_terminal_italics = 2
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]) -- this seem to work
-- vim.cmd([[augroup illuminate_augroup
--     autocmd!
--     autocmd VimEnter * hi link illuminatedWord CursorLine
-- augroup END
-- ]])
-- --
-- vim.cmd([[augroup illuminate_augroup
--      autocmd!
--      autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
-- augroup END]])
vim.cmd([[colorscheme onedark]])

-- vim.api.nvim_set_option("clipboard", "unnamedplus")

--Set statusbar
--vim.g.lightline = {
--	colorscheme = 'onedark',
--	active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
--	component_function = { gitbranch = 'fugitive#head' },
--}
