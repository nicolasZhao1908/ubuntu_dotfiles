vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

-- Go to the mark's column
vim.keymap.set("n", "'", "`")

-- Currently using nvim-tree checkout lua/user/plugins/nvimtree
-- vim.keymap.set('n', '<Leader>pv', vim.cmd.Ex)

-- Paste and move the deleted content to the void register
vim.keymap.set("v", "<Leader>p", '"_dP', { desc = "[P]aste and move replacement to void register" })
-- More void register
vim.keymap.set("v", "<Leader>d", '"_d', { desc = "[D]elete to void register" })
vim.keymap.set("n", "<Leader>d", '"_d', { desc = "[D]elete to void register" })

-- Turn off search highlights
vim.keymap.set("n", "<Leader>nh", ":nohlsearch<CR>", { desc = "[N]o Search [H]ighlight" })

-- Switch focused buffer
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch to left buffer" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch to right buffer" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Switch to top buffer" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Switch to bottom buffer" })

-- Scroll and stay in middle
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Move lines and indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line to upward." })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line to downward." })


local function open_file()
    local current_file = vim.fn.expand("<cfile>")
    io.popen("xdg-open '" .. current_file .. "' &")
end

vim.keymap.set("", "gx", open_file,
{ noremap = true, silent = true, desc = "[G]lobal e[x]ecute hovered filename or URL." })
