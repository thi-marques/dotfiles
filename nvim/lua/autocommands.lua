local commands_group = vim.api.nvim_create_augroup("CustomCommands", { clear = true })
local autocmd = function(event, options)
	options = options == nil and {} or options
	options.group = options.group == nil and commands_group or options.group

	vim.api.nvim_create_autocmd(event, options)
end

-- Highlight the region on yank
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end
})

-- Set autoread when a file is changed from the outside
vim.opt.autoread = true
autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	command = 'checktime'
})

-- Auto reload configs on save
autocmd("BufWritePost", {
	pattern = { 'autocommands.lua', 'colorscheme.lua', 'keybinds.lua', 'options.lua', 'lualine.lua' },
	command = 'source <afile>'
})

local function update_plugins()
	vim.cmd([[
		source <afile>	
		CocRestart
		PackerUpdate
		CocUpdate
	]])
end

-- Auto reload plugins on save
autocmd("BufWritePost", {
	pattern = 'plugins.lua',
	callback = update_plugins
})

-- Prevent Markdown from complaining about underscores
autocmd("BufRead", {
	pattern = { "*.md", "*.markdown" },
	command = [[ hi link markdownError NONE ]]
})

local function auto_save()
	local file_name = vim.fn.expand('%:t')
	if file_name == '' then return end

	if vim.opt.autowriteall:get() then
		vim.cmd.wall()
	elseif vim.opt.autowrite:get() then
		vim.cmd.update()
	end
end

autocmd("FocusLost", {
	nested = true,
	callback = auto_save
})

return autocmd
