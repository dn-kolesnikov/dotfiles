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
		},
		signcolumn = true,
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 1000,
			virt_text_priority = 100,
		},
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
	},
}
