--
-- You can edit the default settings of the shortcut keys here
--
return {
	-- The default '<leader>' is the space.
	leader = " ",

	-- Use the shortcut to switch/jump window.
	jump_left_window = "<C-h>",
	jump_right_window = "<C-l>",
	jump_up_window = "<C-k>",
	jump_down_window = "<C-j>",

	-- View other usage of the plugin: https://github.com/akinsho/bufferline.nvim
	-- Use the shortcut to pick a buffer tab.
	pick_tab = "<leader>tt",

	-- View other usage of the plugin: https://github.com/nvim-neo-tree/neo-tree.nvim
	-- Use the shortcut to open or close file explorer.
	file_explorer = "\\e",
	-- Use the shortcut to open or close git status on a float window.
	git_status = "<leader>gs",

	-- View other usage of the plugin: https://github.com/stevearc/aerial.nvim
	-- Use the shortcut to open or close the outline, it need to call the lsp server.
	outline = "<leader>sf",

	-- View other usage of the plugin: https://github.com/akinsho/toggleterm.nvim
	-- Use the shortcut to open or close the terminal.
	terminal_float = "<leader>tf", -- open terminal in a float window
	terminal_bottom = "<leader>tb", -- open terminal at the bottom

	-- View other usage of the plugin: https://github.com/Shatur/neovim-session-manager
	-- Use the shortcut to switch a session.
	switch_session = "<leader>ss",

	-- View other usage of the plugin: https://github.com/nvim-telescope/telescope.nvim
	-- Use the shortcut to find, search files and find buffers.
	find_files = "<leader>gf",
	live_grep = "<leader>gg",
	search_cursor = "<leader>cc",
	find_buffer = "<leader>bb",
	-- Use the to close telescope window. <C-c> is the default setting, can't edit it here.
	-- close_telescope  = "<C-c>",

	-- View other usage of the plugin: https://github.com/sindrets/diffview.nvim
	-- Use the shortcut to open 'git diff'.
	diff_open = "<leader>df",
	-- Use the shortcut to close 'git diff'.
	diff_close = "<leader>dc",

	-- View other usage of the plugin: https://github.com/mrjones2014/smart-splits.nvim
	-- Use the shortcut to resize the window, <control + alt + hjkl>
	resize_left = "<C-A-h>",
	resize_down = "<C-A-j>",
	resize_up = "<C-A-k>",
	resize_right = "<C-A-l>",

	-- View other usage of the plugin: https://github.com/neovim/nvim-lspconfig
	-- Goto
	goto_definition = "gd",
	goto_references = "gr",
	goto_declaration = "gD",
	goto_impl = "gi",
	-- goto_back           = "<C-o>",
	-- Use the shortcut to rename the code symbols.
	lsp_rename = "<leader>re",
	-- Use the shortcut to format your codes.
	format = "\\f",

	-- Go to tabs
	new_tab = "\\t",
	next_tab = "<C-b>",
	prev_tab = "<C-f>",

	-- New line
	new_line_above = "<S-CR>",
	new_line_below = "<CR>",

	-- Operations
	exit_insert_mode = "jk",
	cursor_home = "<C-a>",
	cursor_end = "<C-e>",
	cursor_left = "<C-b>",
	cursor_right = "<C-f>",
	cursor_delete = "<C-d>",

	-- Trouble
	list_errors = "<leader>el",
	list_workspace_errors = "<leader>eL",
	next_error = "<leader>en",
	prev_error = "<leader>ep",
	fix_error = "<leader>ef",

	-- Other
	toggle_highlight = "\\h",
}
