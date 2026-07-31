return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "✚" },
			change = { text = "~" },
			delete = { text = "✖" },
			topdelete = { text = "▔" },
			changedelete = { text = "≃" },
			untracked = { text = "┆" },
		},
		signcolumn = true,
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 1000,
			virt_text_priority = 100,
			use_focus = true,
		},
		watch_gitdir = {
			follow_files = true,
		},
	},
}
