return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<localleader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope: Find Files" },
		{ "<localleader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Telescope: Live Grep" },
		{ "<localleader>fb", "<cmd>Telescope buffers<cr>",    desc = "Telescope: List Buffers" },
		{ "<localleader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Telescope: Help Tags" },
	},
}
