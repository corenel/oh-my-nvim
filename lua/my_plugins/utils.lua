return {
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	{
		"tpope/vim-surround",
		event = { "BufRead" },
	},
	{
		"ojroques/nvim-osc52",
		event = { "BufRead" },
		config = function()
			local function copy(lines, _)
				require("osc52").copy(table.concat(lines, "\n"))
			end

			local function paste()
				return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
			end

			vim.g.clipboard = {
				name = "osc52",
				copy = { ["+"] = copy, ["*"] = copy },
				paste = { ["+"] = paste, ["*"] = paste },
			}
			vim.opt.clipboard:append("unnamedplus")
		end,
	},
	{
		"nacro90/numb.nvim",
		event = { "BufRead" },
		config = function()
			local numb = require("numb")
			numb.setup()
		end,
	},
}
