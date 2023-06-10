return {
    'nvim-lualine/lualine.nvim',
    dependencies = { { "kyazdani42/nvim-web-devicons", lazy = true } },
    opts = {
        options = {
            icons_enabled = false,
            theme = "gruvbox-material",
            component_separators = "|",
            section_separators = "",
        }
    }
}
