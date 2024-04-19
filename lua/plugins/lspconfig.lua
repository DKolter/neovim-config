return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("<leader>lr", vim.lsp.buf.rename, "Rename")
				map("<leader>la", vim.lsp.buf.code_action, "Code Action")
				map("<leader>k", vim.lsp.buf.hover, "Hover Documentation")
				map("<leader>lf", vim.lsp.buf.format, "Format")
				map("<leader>le", vim.diagnostic.open_float, "Show diagnostic")

				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
					border = "rounded",
				})

				vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
					border = "rounded",
				})

				vim.keymap.set("n", "<ESC>", vim.cmd.noh, { desc = "Clear search", noremap = true })
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			rust_analyzer = {},
			pyright = {},
			html = {},
			cssls = {},
			tsserver = {},
			wgsl_analyzer = {
				filetypes = { "wgsl" },
			},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
		}

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
		})
		require("mason-tool-installer").setup { ensure_installed = ensure_installed }

		require("mason-lspconfig").setup {
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		}

		vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
			pattern = "*.wgsl",
			callback = function()
				vim.bo.filetype = "wgsl"
			end,
		})
	end,
}
