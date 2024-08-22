return {
	{
		"ojroques/nvim-lspfuzzy",
		event = { "BufRead" },
		dependencies = {
			"neovim/nvim-lspconfig",
			{ "junegunn/fzf", event = "BufRead" },
			-- to enable preview (optional)
			{ "junegunn/fzf.vim", event = "BufRead" },
		},
		config = function()
			local lspfuzzy = require("lspfuzzy")
			lspfuzzy.setup()
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "BufRead",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			local saga = require("lspsaga")
			saga.setup({
				ui = {
					winblend = 5,
				},
				lightbulb = {
					enable = false,
				},
				symbol_in_winbar = {
					enable = false,
				},
				diagnostic = {
					border_follow = false,
					keys = {
						exec_action = "o",
						quit = "q",
						go_action = "g",
					},
				},
				finder = {
					keys = {
						quit = { "q", "<ESC>" },
					},
				},
				code_action = {
					show_server_name = true,
					keys = {
						quit = { "q", "<ESC>" },
						exec = "<CR>",
					},
				},
				rename = {
					in_select = false,
					quit = "<ESC>",
					exec = "<CR>",
					confirm = "<CR>",
				},
			})
		end,
	},
	{
		"folke/trouble.nvim",
		event = { "BufRead" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		cmd = "Trouble",
		config = function()
			local signs = {
				-- icons / text used for a diagnostic
				error = "󰅚",
				warning = "",
				-- for vim.fn.sign_define
				warn = "",
				hint = "",
				information = "",
				-- for vim.fn.sign_define
				info = "",
				other = "",
			}

			local trouble = require("trouble")
			trouble.setup({})

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type:gsub("^%l", string.upper)
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
	},
}
