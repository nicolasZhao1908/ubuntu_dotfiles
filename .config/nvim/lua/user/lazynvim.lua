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
    --
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",             -- Required
            "williamboman/mason.nvim",           -- Optional
            "williamboman/mason-lspconfig.nvim", -- Optional

            -- Autocompletion
            "hrsh7th/nvim-cmp",         -- Required
            "hrsh7th/cmp-nvim-lsp",     -- Required
            "hrsh7th/cmp-buffer",       -- Optional
            "hrsh7th/cmp-path",         -- Optional
            "saadparwaiz1/cmp_luasnip", -- Optional
            "hrsh7th/cmp-nvim-lua",     -- Optional

            -- Snippets
            "L3MON4D3/LuaSnip",             -- Required
            "rafamadriz/friendly-snippets", -- Optional
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "jose-elias-alvarez/null-ls.nvim" },
        },
    },


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
        config = function()
            require("fidget").setup({})
        end,
    },

    -- Utils
    {
        "ekickx/clipboard-image.nvim",
        config = function()
            require("clipboard-image").setup({
                -- Default configuration for all filetype
                default = {
                    img_dir = "assets/img",
                    img_name = function()
                        vim.fn.inputsave()
                        local name = vim.fn.input("Name: ")
                        vim.fn.inputrestore()
                        return name
                    end,
                    affix = "<\n  %s\n>", -- Multi lines affix
                },
                plaintex = {
                    affix = "\\begin{figure}[H]\\includegraphics{%s}\\end{figure}", -- Multi lines affix
                },
            })
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        build = "cd app && npm install",
        ft = { "markdown" },
        config = function()
            vim.keymap.set("n", "<Leader>m", "<Plug>MarkdownPreview", { desc = "Markdown Preview" })
            vim.keymap.set("n", "<Leader>M", "<Plug>MarkdownPreviewStop", { desc = "Markdown Preview" })
        end,

    },
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = { "nvim-tree/nvim-tree.lua" },
        config = function()
            require("lsp-file-operations").setup()
        end
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
}

local opts = {}

require("lazy").setup(plugins, opts)
