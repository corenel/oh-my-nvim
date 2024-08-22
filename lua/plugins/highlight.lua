return {
	-- Syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				indent = {
					enable = true,
					disable = {},
				},
				ensure_installed = { "markdown", "markdown_inline", "regex" },
				sync_install = false,
				auto_install = true,
				ignore_install = {},

				highlight = {
					enable = true,
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
						-- a workaround for the error reported in the current version (0b8b78f)
						-- Error in decoration provider treesitter/highlighter.win:
                        -- Error executing lua: ...2829/usr/share/nvim/runtime/lua/vim/treesitter/query.lua:252: Query error at 1:3. Invalid node type "comment"
						if lang == "gitcommit" then
							return true
						end
					end,
					additional_vim_regex_highlighting = false,
				},
			})

			-- let it to use 'markdown' parser for mdx filetype.
			vim.treesitter.language.register('markdown', 'mdx')
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
