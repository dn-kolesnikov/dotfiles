-- treesitter config
local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
	return
end

-- enable tree-sitter fo all language modules
treesitter.setup({
	highlight = {
		enable = true,
	},
})

