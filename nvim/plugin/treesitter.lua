local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
	print("Treesitter not found")
	return
end

treesitter.setup({
	highlight = { enable = true },
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"go",
	},
	-- auto install above language parsers
	auto_install = true,
})
