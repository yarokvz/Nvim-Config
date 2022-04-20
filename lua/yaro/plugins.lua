-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
	augroup Packer
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager
	use 'tpope/vim-fugitive' -- Git commands in nvim
	use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
	use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
	use 'ludovicchabant/vim-gutentags' -- Automatic tags management
	-- UI to select things (files, grep results, open buffers...)
	use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
	use 'joshdick/onedark.vim' -- Theme inspired by Atom
--	use 'itchyny/lightline.vim' -- Fancier statusline
	-- Add indentation guides even on blank lines
	use 'lukas-reineke/indent-blankline.nvim'
	-- Add git related info in the signs columns and popups
	use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/playground'
	-- Additional textobjects for treesitter
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
	use 'williamboman/nvim-lsp-installer'
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use 'rafamadriz/friendly-snippets'
	use 'mattn/emmet-vim'
--	use 'chrisbra/Colorizer' 
	use 'gorodinskiy/vim-coloresque'
	use 'turbio/bracey.vim'
	use 'windwp/nvim-autopairs'
	use 'akinsho/bufferline.nvim'
	use 'akinsho/toggleterm.nvim'
	use 'goolord/alpha-nvim'
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		config = function() require'nvim-tree'.setup {} end
	}
	use 'DonnieWest/VimStudio'
	use 'nvim-lualine/lualine.nvim'
end)
