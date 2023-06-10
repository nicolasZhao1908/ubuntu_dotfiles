local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
local plugins = {
    -- Themes
    "sainnhe/gruvbox-material",
    -- Tree sitter
    { "nvim-treesitter/nvim-treesitter-textobjects", dependencies = { "nvim-treesitter/nvim-treesitter" } },
    -- Undo tree
    "mbbill/undotree",
    -- Tmux
    "aserowy/tmux.nvim",
    -- Indentation guide
    "lukas-reineke/indent-blankline.nvim",
    -- LSP related
    "neovim/nvim-lspconfig",             -- Required
    "williamboman/mason.nvim",           -- Optional
    "williamboman/mason-lspconfig.nvim", -- Optional
    {
        "hrsh7th/nvim-cmp",
        dependencies = {

            "hrsh7th/cmp-nvim-lsp",     -- Required
            "hrsh7th/cmp-buffer",       -- Optional
            "hrsh7th/cmp-path",         -- Optional
            "saadparwaiz1/cmp_luasnip", -- Optional
            "hrsh7th/cmp-nvim-lua",     -- Optional

            -- Snippets
            "L3MON4D3/LuaSnip", -- Required
        }
    },
    -- {
    --     "jay-babu/mason-null-ls.nvim",
    --     dependencies = {
    --         { "williamboman/mason.nvim" },
    --         { "jose-elias-alvarez/null-ls.nvim" },
    --     },
    -- },


    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.1",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- Quick file switch
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { { "kyazdani42/nvim-web-devicons", lazy = true } },
    },
    -- LSP progress
    {
        "j-hui/fidget.nvim",
        opts = {}
    },
    --- Neovim LSP
    { "folke/neodev.nvim",                           opts = {} },

    -- Utils
    'wakatime/vim-wakatime',
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = { "nvim-tree/nvim-tree.lua" },
        opts = {}
    },
    {
        "windwp/nvim-autopairs",
        opts = {}
    },
    {
        "norcalli/nvim-colorizer.lua",
        opts = {}
    },
    {
        "numToStr/Comment.nvim",
        opts = {}
    },
}

local opts = {}

require("lazy").setup(plugins, opts)
