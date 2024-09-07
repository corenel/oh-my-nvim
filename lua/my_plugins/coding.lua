return {
	{
		"sheerun/vim-polyglot",
		enabled = false,
		event = { "BufRead" },
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},
	{
		"yetone/avante.nvim",
		-- dir = "/Users/yuthon/Workspace/aigc/avante.nvim",
		-- name = "avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			-- add any opts here
			-- provider = "openai",
			-- provider = "copilot",
			provider = "deepseek",
			openai = {
				endpoint = "https://burn.hair/v1",
				model = "gpt-4o",
				-- endpoint = "https://openrouter.ai/api/v1",
				-- model = "anthropic/claude-3.5-sonnet",
				-- model = "openai/gpt-4o-2024-08-06",
			},
			vendors = {
				---@type AvanteProvider
				deepseek = {
					["local"] = false,
					endpoint = "https://api.deepseek.com",
					model = "deepseek-chat",
					api_key_name = "DEEPSEEK_API_KEY",
					parse_curl_args = function(opts, code_opts)
						return {
							url = opts.endpoint .. "/chat/completions",
							headers = {
								["Accept"] = "application/json",
								["Content-Type"] = "application/json",
								["Authorization"] = "Bearer " .. opts.parse_api_key(),
							},
							body = {
								model = opts.model,
								messages = require("avante.providers").copilot.parse_message(code_opts), -- you can make your own message, but this is very advanced
								max_tokens = 4096,
								stream = true,
							},
						}
					end,
					parse_response_data = function(data_stream, event_state, opts)
						require("avante.providers").openai.parse_response(data_stream, event_state, opts)
					end,
				},
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make BUILD_FROM_SOURCE=true",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to setup it properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
