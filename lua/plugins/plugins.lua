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

    --git plugins
    use 'tpope/vim-fugitive' -- Git commands in nvim
    use 'tpope/vim-rhubarb'  -- Fugitive-companion to interact with github
    -- Add git related info in the signs columns and popups
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use "mbbill/undotree"

    --comments
    use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines

    -- UI to select things (files, grep results, open buffers...)
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    --colorthemes
    use 'navarasu/onedark.nvim'

    -- Add indentation guides even on blank lines
    use 'lukas-reineke/indent-blankline.nvim'

    --treesitter
    --Highlight, edit, and navigate code using a fast incremental parsing library
    use { 'nvim-treesitter/nvim-treesitter' }
    use 'nvim-treesitter/playground'
    -- Additional textobjects for treesitter
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    --lsp plugins
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    --dap (debbuging)
    use {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui"
    }

    --use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'mattn/emmet-vim'
    use 'wuelnerdotexe/vim-astro'

    -- use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
    use "jose-elias-alvarez/null-ls.nvim"

    --lualine and features(navic)
    use 'nvim-lualine/lualine.nvim'
    use {
        "jcdickinson/wpm.nvim",
        config = function()
            require("wpm").setup({
            })
        end
    }
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    }

    --snippets
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'rafamadriz/friendly-snippets'
    use 'saadparwaiz1/cmp_luasnip'

    --colorizer
    use 'norcalli/nvim-colorizer.lua'

    --autopairs
    use 'windwp/nvim-autopairs'

    --file explorer
    use 'matbme/JABS.nvim'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
    }

    --terminal
    --    use 'akinsho/toggleterm.nvim'
    use 'NvChad/nvterm'

    --welcome screen
    use 'goolord/alpha-nvim'

    --duplication marking in fancy
    use 'RRethy/vim-illuminate'

    --Rest API
    use {
        "NTBBloodbath/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }

    use "folke/neodev.nvim"
    use "ThePrimeagen/vim-be-good"

    --time management
    use {
        'wthollingsworth/pomodoro.nvim',
        requires = 'MunifTanjim/nui.nvim',
        config = function()
            require('pomodoro').setup({
                time_work = 25,
                time_break_short = 5,
                time_break_long = 20,
                timers_to_long_break = 4
            })
        end
    }
end)

vim.g.astro_javascript = 'enable'
