-- file explorer config
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end
nvim_tree.setup({
	hijack_netrw = false,
	open_on_tab = false,
	sync_root_with_cwd = true,
	view = {
		relativenumber = false,
		number = false,
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "none",
		root_folder_label = ":t",
		indent_width = 2,
		indent_markers = {
			enable = false,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
        },
    },
})
