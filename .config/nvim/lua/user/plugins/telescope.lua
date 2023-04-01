local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sa', function() builtin.find_files { no_ignore = true, hidden = true } end,
    { desc = '[S]earch [A]ll Files' })
vim.keymap.set('n', '<leader>sh', function() builtin.find_files { hidden = true } end,
    { desc = '[S]earch [H]idden Files' })
vim.keymap.set('n', '<leader>si', function() builtin.find_files { no_ignore = true } end,
    { desc = '[S]earch [I]gnored Files' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = '[S]earch [S]tring' })
vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = '[S]earch [G]it Files' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sq', builtin.quickfix, { desc = '[S]earch [Q]uickfix List' })
