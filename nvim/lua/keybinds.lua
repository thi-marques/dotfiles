--- Map keys to nvim's commands and shortcuts.
---@param mode "" | "n" | "v" | "s" | "x" | "o" | "!" | "i" | "l" | "c" | "t" As in Vim modes like Normal/Insert mode
---@param lhs string The custom keybinds you need
---@param rhs any The commands or existing keybinds to customise
---@param opts table? Additional options like <silent>/<noremap>, see :h map-arguments for more info on it
local function keyset(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

-- Back to normal
keyset('i', 'jk', '<ESC>')

-- Clear searches highlights
keyset('n', '<Leader><ESC>', ':nohl<Return>', { silent = true })

-- Don't copy deleted character
keyset('n', 'x', '"_x')
keyset('v', 'x', '"_x')
keyset('x', 'x', '"_x')

-- Paste without overriding the current register
keyset('v', 'p', 'pgvy')

-- Increment/decrement
keyset('n', '+', '<C-a>')
keyset('n', '-', '<C-x>')
keyset('x', '+', '<C-a>')
keyset('x', '-', '<C-x>')
keyset('x', 'g+', 'g<C-a>')
keyset('x', 'g-', 'g<C-x>')

-- Select all
keyset('n', '<C-a>', 'gg<S-v>G')
-- Copy/Cut to system clipboard
keyset('v', '<Leader>y', '"+y')
keyset('n', '<Leader>y', '"+y')
keyset('v', '<Leader>d', '"+d')
keyset('n', '<Leader>d', '"+d')
keyset('n', '<Leader>D', '"+D')

-- Split navigation
keyset('n', '<M-S>', ':split<Return><C-w>w', { silent = true })
keyset('n', '<M-s>', ':vsplit<Return><C-w>w', { silent = true })

-- Document navigation
keyset('n', '<C-j>', '<C-d>')
keyset('n', '<C-k>', '<C-u>')
keyset('v', '<C-j>', '<C-d>')
keyset('v', '<C-k>', '<C-u>')

-- Lines copy/move
keyset('n', '<M-k>', ':move .-2<Return>==')
keyset('n', '<M-K>', ':copy .-1<Return>==')
keyset('n', '<M-j>', ':move .+1<Return>==')
keyset('n', '<M-J>', ':copy .+0<Return>==')
keyset('i', '<M-k>', '<Esc>:move .-2<Return>==gi')
keyset('i', '<M-K>', '<Esc>:copy .0<Return>==gi')
keyset('i', '<M-j>', '<Esc>:move .+1<Return>==gi')
keyset('i', '<M-J>', '<Esc>:copy .-1<Return>==gi')
keyset('v', '<M-k>', ":move '<-2<Return>gv=gv")
keyset('v', '<M-K>', ":copy '>0<Return>gv=gv")
keyset('v', '<M-j>', ":move '>+1<Return>gv=gv")
keyset('v', '<M-J>', ":copy '<-1<Return>gv=gv")

-- Indentation
keyset('n', '<Tab>', '>>')
keyset('n', '<S-Tab>', '<<')
keyset('v', '<Tab>', '>gv')
keyset('v', '<S-Tab>', '<gv')

-- Prevent C-i to be mapped as tab
keyset('n', '<C-i>', '<C-I>')

-- Close and save
keyset('n', '<C-q>', ':q<Return>', { noremap = false, silent = true })
keyset('n', '<C-s>', ':w<Return>', { silent = true })
keyset('i', '<C-q>', '<ESC>:q<Return>', { noremap = false, silent = true })
keyset('i', '<C-s>', '<ESC>:w<Return>', { silent = true })
-- Delete buffer
keyset('n', '<M-q>', ':bdelete<Return>', { noremap = false, silent = true })

-- Backspace delete
keyset('i', '<C-BS>', '<C-w>')

-- Toggle wraplines
keyset('', '<M-z>', function() vim.opt.wrap = not vim.opt.wrap:get() end)

-- Vim visual multi
keyset('n', '<C-L>', ':call vm#commands#find_all(0, 1)<cr>', { noremap = true, silent = true })

return keyset
