--- Inspired by https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
require("user.settings")
require("user.keymaps")

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
local plugins = {
    -- [[ Git integration ]]
    "tpope/vim-fugitive",
    -- [[ Utils ]]
    -- Infers the shift and tabsize
    "tpope/vim-sleuth",
    'wakatime/vim-wakatime',
    {
        "antosha417/nvim-lsp-file-operations",
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
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {}
    },
    -- [[ LSP ]]
    require "user/plugins/lsp",
    -- Themes
    require "user/plugins/theme",
    -- Tree sitter
    require 'user/plugins/treesitter',
    -- Undo tree
    require "user/plugins/undotree",
    -- Tmux
    require "user/plugins/tmux",
    -- Fuzzy finder
    require "user/plugins/telescope",
    -- Quick file switch
    require "user/plugins/harpoon",
    -- Status line
    require "user/plugins/lualine",
    -- File tree
    require "user/plugins/nvimtree",

}

local opts = {}

require("lazy").setup(plugins, opts)
