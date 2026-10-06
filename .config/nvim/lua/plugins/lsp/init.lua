return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {},
			},
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			local servers = {
				-- vtsls = {
				-- 	on_attach = function(client, bufnr)
				-- 		client.server_capabilities.documentFormattingProvider = false
				-- 		client.server_capabilities.documentRangeFormattingProvider = false
				-- 	end,
				-- },
				tsgo = {
					settings = {
						typescript = {
							inlayHints = {
								parameterNames = {
									enabled = "literals",
									suppressWhenArgumentMatchesName = true,
								},
								parameterTypes = { enabled = true },
								variableTypes = { enabled = true },
								propertyDeclarationTypes = { enabled = true },
								functionLikeReturnTypes = { enabled = true },
								enumMemberValues = { enabled = true },
							},
						},
					},
					cmd = function(dispatchers, config)
						local cmd = "tsgo"
						if (config or {}).root_dir then
							local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", cmd)
							if vim.fn.executable(local_cmd) == 1 then
								cmd = local_cmd
							end
						end
						return vim.lsp.rpc.start({ cmd, "--lsp", "--stdio" }, dispatchers)
					end,
					filetypes = {
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
					},
					root_dir = function(bufnr, on_dir)
						-- The project root is where the LSP can be started from
						-- As stated in the documentation above, this LSP supports monorepos and simple projects.
						-- We select then from the project root, which is identified by the presence of a package
						-- manager lock file.
						local root_markers =
							{ "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" }
						-- Give the root markers equal priority by wrapping them in a table
						root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers, { ".git" } }
							or vim.list_extend(root_markers, { ".git" })

						local deno_root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
						local deno_lock_root = vim.fs.root(bufnr, { "deno.lock" })
						local project_root = vim.fs.root(bufnr, root_markers)
						if deno_lock_root and (not project_root or #deno_lock_root > #project_root) then
							-- deno lock is closer than package manager lock, abort
							return
						end
						if deno_root and (not project_root or #deno_root >= #project_root) then
							-- deno config is closer than or equal to package manager lock, abort
							return
						end
						-- project is standard TS, not deno
						-- We fallback to the current working directory if no project root is found
						on_dir(project_root or vim.fn.getcwd())
					end,
				},
				bashls = {},
				stylua = {},
				gopls = {},
				cssls = {},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							imports = {
								granularity = {
									group = "module",
								},
								prefix = "self",
							},
							cargo = {
								buildScripts = {
									enable = true,
								},
							},
							procMacro = {
								enable = true,
							},
						},
					},
				},
				lua_ls = {
					on_init = function(client)
						if client.workspace_folders then
							local path = client.workspace_folders[1].name
							if
								path ~= vim.fn.stdpath("config")
								and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
							then
								return
							end
						end
						client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
							runtime = {
								version = "LuaJIT",
								path = { "lua/?.lua", "lua/?/init.lua" },
							},
							workspace = {
								checkThirdParty = false,
								library = vim.tbl_extend("force", vim.api.nvim_get_runtime_file("", true), {
									"${3rd}/luv/library",
									"${3rd}/busted/library",
								}),
							},
						})
					end,
					settings = {
						Lua = {},
					},
				},
			}
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
			for name, server in pairs(servers) do
				vim.lsp.config(name, server)
				vim.lsp.enable(name)
			end
		end,
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {},
				opts = {},
			},
		},
		opts = {
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = { auto_show = false, auto_show_delay_ms = 500 },
			},
			sources = {
				default = { "lsp", "path", "snippets" },
			},
			snippets = { preset = "luasnip" },
			fuzzy = { implementation = "prefer_rust_with_warning" },
			signature = { enabled = true },
		},
	},
}
