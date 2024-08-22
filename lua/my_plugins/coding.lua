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
		event = "VeryLazy",
		build = "make",
		opts = {
			-- add any opts here
			provider = "copilot",
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			{
				"grapp-dev/nui-components.nvim",
				dependencies = {
					"MunifTanjim/nui.nvim",
				},
			},
			--- The below is optional, make sure to setup it properly if you have lazy=true
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
