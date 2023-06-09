local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
	print("Gitsigns not found")
	return
end

gitsigns.setup({
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = true,      -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = true,  -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true
	},
	attach_to_untracked = true,
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol',   -- 'eol' | 'overlay' | 'right_align'
		virt_text_priority = 6000, -- To appear after Rust's type inference
		delay = 2000,
		ignore_whitespace = true,
	},
	current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
	sign_priority = 6,
	update_debounce = 100,
	-- status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = { -- Options passed to nvim_open_win
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
	},
	yadm = {
		enable = false
	},
})

-- Keybinds
local keybind_ok, keybind = pcall(require, 'keybinds')
if not keybind_ok then
	print("Keybinds not found in Gitsigns")
	return
end

keybind("n", "<M-[>", ":Gitsigns prev_hunk<Return>")
keybind("n", "<M-]>", ":Gitsigns next_hunk<Return>")

keybind("n", "<M-u>", ":Gitsigns reset_hunk<Return>")
keybind("v", "<M-u>", ":Gitsigns reset_hunk<Return>")
keybind("x", "<M-u>", ":Gitsigns reset_hunk<Return>")
