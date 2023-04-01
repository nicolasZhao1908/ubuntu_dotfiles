vim.opt.signcolumn = 'no'
vim.opt.guicursor = ''
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.relativenumber = true

vim.opt.history = 50
vim.opt.mps:append('<:>')

vim.opt.termguicolors = true
vim.opt.wrap = false

vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 8

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

--- Hightlight on yank :h vim.hightlight.on_yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.opt.clipboard:append('unnamedplus')
