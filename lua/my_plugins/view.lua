return {
	{
		"j-hui/fidget.nvim",
		enabled = true,
		event = { "BufRead" },
		config = function()
			local fidget = require("fidget")
			fidget.setup({
				progress = {
					display = {
						progress_icon = {
							pattern = "moon",
							period = 1,
						},
					},
				},
			})
		end,
	},
	{
		"karb94/neoscroll.nvim",
		enabled = true,
		event = { "BufRead" },
		config = function()
			local neoscroll = require("neoscroll")
			neoscroll.setup()
		end,
	},
	{
		"danilamihailov/beacon.nvim",
		enabled = false,
		event = { "BufRead" },
	},
	{
		"RRethy/vim-illuminate",
		enabled = true,
		event = { "BufRead" },
	},
	{
		"petertriho/nvim-scrollbar",
		enabled = true,
		dependencies = {
			{
				"kevinhwang91/nvim-hlslens",
				event = "BufRead",
				config = function()
					local hlslens = require('hlslens')
					hlslens.setup()
				end,
			},
		},
		config = function()
			local scrollbar = require("scrollbar")
			require("scrollbar.handlers.search").setup()
			scrollbar.setup()
		end,
	},
	{
		"tzachar/highlight-undo.nvim",
		enabled = true,
	},
}
