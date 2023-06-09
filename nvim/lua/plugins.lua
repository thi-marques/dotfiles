local ok, packer = pcall(require, "packer")
if not ok then
	print("Packer not founded. I'll try to install it")
	local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd('packadd packer.nvim')
end

-- CoC extesions
vim.g.coc_global_extensions = {
	'coc-snippets',
	'coc-json',
	'coc-prettier',
	'coc-tsserver',
	'coc-java',
	'coc-sumneko-lua',
	'coc-rust-analyzer',
	'coc-sh',
	'coc-go',
	'coc-explorer'
}

packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Nord Theme
	use("arcticicestudio/nord-vim")

	-- Colors for hex, rgb, hsl, etc.
	use('brenoprata10/nvim-highlight-colors')

	-- Lualine
	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	})

	-- Tabline
	use {
		'kdheepak/tabline.nvim',
		requires = { 'nvim-lualine/lualine.nvim', 'kyazdani42/nvim-web-devicons' }
	}

	-- Coc
	use({ 'neoclide/coc.nvim', branch = 'release' })

	-- JSONC
	use('neoclide/jsonc.vim')

	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

	-- Visual Multi
	use('mg979/vim-visual-multi')

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Treesitter Syntax Highlighting
	use("nvim-treesitter/nvim-treesitter")

	-- Auto pairs and surround
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use('tpope/vim-surround')

	-- Comments
	use('tpope/vim-commentary')

	-- GitSigns
	use("lewis6991/gitsigns.nvim")

	-- Scrollbar
	use({
		"petertriho/nvim-scrollbar",
		requires = { { "lewis6991/gitsigns.nvim" } },
	})

	-- Codi Vim - Live interpreter
	use("metakirby5/codi.vim")

	-- JSDocs
	use({
		"heavenshell/vim-jsdoc",
		run = "make clean && make install"
	})

	if packer_bootstrap then
		packer.sync()
	end
end
)
