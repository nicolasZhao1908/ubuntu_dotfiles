return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"L3MON4D3/LuaSnip",
		"folke/neodev.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, { desc = "Show [E]rror" })
		vim.keymap.set("n", "<Leader>dp", vim.diagnostic.goto_prev, { desc = "[D]iagnostic [P]rev" })
		vim.keymap.set("n", "<Leader>dn", vim.diagnostic.goto_next, { desc = "[D]iagnostic [N]ext" })

		local servers = {
			rust_analyzer = {
				checkOnSave = true,
				check = {
					command = "clippy",
					extraArgs = { "--", "-Wclippy::perf" },
				},
			},
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
			verible = {},
		}
		-- [[ Configure LSP ]]
		--  This function gets run when an LSP connects to a particular buffer.
		local on_attach = function(_, bufnr)
			-- NOTE: Remember that lua is a real programming language, and as such it is possible
			-- to define small helper and utility functions so you don't have to repeat yourself
			-- many times.
			--
			-- In this case, we create a function that lets us more easily define mappings specific
			-- for LSP related items. It sets the mode, buffer and description for us each time.
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

			nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
			nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
			nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

			-- See `:help K` for why this keymap
			nmap("K", vim.lsp.buf.hover, "Hover Documentation")
			-- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

			-- Lesser used LSP functionality
			nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

			nmap("<Leader>F", function()
				vim.lsp.buf.format({
					async = true,
					filter = function(client)
						-- apply whatever logic you want (in this example, we'll only use null-ls)
						return client.name == "null-ls"
					end,
				})
			end, "[F]ormat current buffer")
		end
		require("neodev").setup()
		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				local setup_options = {
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
				}
				if server_name == "verible" then
					setup_options["root_dir"] = function()
						return vim.loop.cwd()
					end
				end
				require("lspconfig")[server_name].setup(setup_options)
			end,
		})
		-- [[ Configure nvim-cmp ]]
		-- See `:help cmp`
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				documentation = {
					max_height = 15,
					max_width = 60,
				},
			},
			formatting = {
				fields = { "abbr", "menu", "kind" },
				format = function(entry, item)
					local short_name = {
						nvim_lsp = "LSP",
						nvim_lua = "NVIM",
						buffer = "BUF",
						path = "PATH",
						luasnip = "SNIP",
					}

					local menu_name = short_name[entry.source.name] or entry.source.name

					item.menu = string.format("[%s]", menu_name)
					return item
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete({}),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),
			}),
			sources = {
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			update_in_insert = true,
			underline = true,
			severity_sort = false,
			float = true,
		})
		local null_ls = require("null-ls")
		local sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.clang_format.with({
				args = { "-style=file:" .. vim.fn.expand("$XDG_CONFIG_HOME/formatter_config/.clang-format") },
			}),
			null_ls.builtins.formatting.verible_verilog_format.with({
				extra_args = { "--indentation_spaces", "4" },
			}),
			null_ls.builtins.formatting.prettier.with({
				extra_args = {"--config", vim.fn.expand("$XDG_CONFIG_HOME/formatter_config/.prettierrc")}
			}),
		}
		null_ls.setup({
			sources = sources,
		})
	end,
}
