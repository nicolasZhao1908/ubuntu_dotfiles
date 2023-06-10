return {
    'ThePrimeagen/harpoon',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local mark = require('harpoon.mark')
        local ui = require('harpoon.ui')

        vim.keymap.set('n', '<leader>hs', ui.toggle_quick_menu, { desc = "[H]arpoon [S]tatus" })
        vim.keymap.set('n', '<leader>hm', mark.add_file, { desc = "[H]arpoon [M]ark" })
        vim.keymap.set('n', '<leader>H', function() ui.nav_file(1) end, { desc = "[H]arpoon first file" })
        vim.keymap.set('n', '<leader>J', function() ui.nav_file(2) end, { desc = "[H]arpoon second file" })
        vim.keymap.set('n', '<leader>K', function() ui.nav_file(3) end, { desc = "[H]arpoon third file" })
        vim.keymap.set('n', '<leader>L', function() ui.nav_file(4) end, { desc = "[H]arpoon fourth file" })
    end
}
