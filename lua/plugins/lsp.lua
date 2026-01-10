return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
					border = "rounded",
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = true,
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins/lspconfig/config")()
		end,
	},

	{
		-- "jose-elias-alvarez/null-ls.nvim",
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				border = "rounded",
				cmd = { "nvim" },
				debounce = 250,
				debug = false,
				default_timeout = 5000,
				diagnostic_config = {},
				diagnostics_format = "#{m}",
				fallback_severity = vim.diagnostic.severity.ERROR,
				log_level = "warn",
				notify_format = "[null-ls] %s",
				on_init = nil,
				on_exit = nil,
				root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
				should_attach = nil,
				sources = nil,
				temp_dir = nil,
				update_in_insert = false,
				-- formatting on save
				--on_attach = function(client, bufnr)
				--	if client.supports_method("textDocument/formatting") then
				--		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				--		vim.api.nvim_create_autocmd("BufWritePre", {
				--			group = augroup,
				--			buffer = bufnr,
				--			callback = function()
				--				vim.lsp.buf.format({ bufnr = bufnr })
				--			end,
				--		})
				--	end
				--end,
			}) -- end of setup
		end,
	},

	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			-- "jose-elias-alvarez/null-ls.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				automatic_setup = true,
				ensure_installed = { "shfmt", "prettier", "stylua" },
				handlers = {},
			})
		end,
	},
}
