local lsp = require("lsp-zero").preset({
    name = "recommended",
    set_lsp_keymaps = { omit = { "<C-k>" } },
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()
lsp.on_attach(function(client, bufnr)
    -- local opts = { buffer = bufnr }
    local bind = vim.keymap.set

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
    end

    -- Format on save
    -- vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    bind("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
    bind("", "<C-Space>", vim.lsp.buf.completion, { desc = "Toggle completion" })
end)

require('lspconfig').rust_analyzer.setup({
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = true,
            check = {
                command = "clippy",
                extraArgs = { "--", "-Wclippy::pedantic", "-Wclippy::perf" }
            },
        }
    }
})

local cmp = require("cmp")


lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
        ["<C-e>"] = vim.NIL,
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = true,
})

local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup({
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)
    end,
    sources = { null_ls.builtins.formatting.prettierd },
})

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = false, -- You can still set this to `true`
    automatic_setup = true,
})

-- Required when `automatic_setup` is true
require("mason-null-ls").setup {
    handlers = { function()
    end }
}
