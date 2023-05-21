local g = vim.g
local opt = vim.opt

-- Number of screen lines to keep above and below the cursor
opt.scrolloff = 10

-- Appearance
opt.title = true
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
g.t_Co = 256 -- terminal colors
g.defaultterminal = 'xterm-kitty'
g.shell = 'zsh'
opt.list = true
vim.opt.listchars:append({
	tab = "→ ",
	-- space = "·",
	lead = "·", -- "•",
	trail = "·", -- "•",
	-- eol = "↲",
	nbsp = "␣",
	extends = "⟩",
	precedes = "⟨"
})

-- Better editing experience
opt.mouse = "a"
opt.expandtab = false
opt.smarttab = true
opt.cindent = true
opt.autoindent = true
opt.wrap = false
opt.textwidth = 300
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = -1 -- If negative, shiftwidth value is used

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }

-- Undo and backup options
opt.undofile = false
opt.swapfile = false
opt.backup = false -- CoC: Some servers have issues with backup files, see #649
opt.writebackup = false

-- Better buffer splitting
opt.splitright = true
opt.splitbelow = true
opt.autoread = true
opt.updatetime = 1000
local autowrite = true
opt.autowrite = autowrite
opt.autowriteall = autowrite
opt.hidden = not autowrite -- Necessary for autowrite work to propelly https://github.com/neovim/neovim/issues/16470

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- Rust
g.rust_recommended_style = false
