return {
    'mbbill/undotree',
    config = function()
        vim.keymap.set("n", "<Leader>u", ":UndotreeToggle<CR>", { desc = "Toogle [U]ndotree" })
    end
}
