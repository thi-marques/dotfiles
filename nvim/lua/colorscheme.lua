local g = vim.g
local opt = vim.opt

opt.background = 'dark'

g.nord_cursor_line_number_background = true
g.nord_bold = true
g.nord_italic = true
g.nord_italic_comments = true
g.nord_underline_style = true

local autocmd_ok, autocmd = pcall(require, 'autocommands')
if not autocmd_ok then
	print('autocmd not found')
	return
end

local function fold_color()
	vim.api.nvim_set_hl(0, "Folded", { fg = '#5E81AC', ctermfg = 4, bg = '#2E3440', ctermbg = 0 })
	vim.api.nvim_set_hl(0, "CodiVirtualText", { fg = '#EBCB8B', ctermfg = 3, bg = '#2E3440', ctermbg = 0 })
end

autocmd("ColorScheme", {
	pattern = "nord",
	callback = fold_color
})

local coloscheme_ok, _ = pcall(vim.cmd, 'colorscheme nord')
if not coloscheme_ok then
	print('Colorscheme nord not found')
	return
end
