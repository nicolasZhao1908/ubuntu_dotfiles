return {
    'sainnhe/gruvbox-material',
    config = function()
        vim.o.background = "dark"
        vim.g.gruvbox_material_diagnostic_text_highlight = 1
        vim.g.gruvbox_material_better_performance = 1
        vim.g.gruvbox_material_background = "hard"
        vim.g.gruvbox_material_enable_bold = 1
        vim.g.gruvbox_material_enable_italic = 1
        vim.o.termguicolors = true
        vim.cmd("colorscheme gruvbox-material")
    end
}
