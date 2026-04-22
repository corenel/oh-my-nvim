return {
	-- Syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")

			local parsers = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"regex",
			}

			ts.setup()
			ts.install(parsers)

			-- Keep your existing mdx mapping.
			vim.treesitter.language.register("markdown", "mdx")

			local group = vim.api.nvim_create_augroup("user-treesitter", { clear = true })

			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				pattern = "*",
				callback = function(args)
					local max_filesize = 100 * 1024
					local name = vim.api.nvim_buf_get_name(args.buf)
					local ok, stats = pcall(vim.uv.fs_stat, name)

					if ok and stats and stats.size > max_filesize then
						return
					end

					if vim.bo[args.buf].filetype == "gitcommit" then
						return
					end

					local started = pcall(vim.treesitter.start, args.buf)

					-- Optional equivalent-ish replacement for your old indent.enable = true.
					-- Remove this if TS indentation feels weird in some filetypes.
					if started then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},

	-- Colors highlighting
	{
		"NvChad/nvim-colorizer.lua",
		config = function(plun)
			require("colorizer").setup({
				user_default_options = {
					names = false,
				},
			})
		end,
	},
}
