return {
	"navarasu/onedark.nvim",
	priority = 1000,
	opts = {
		highlights = {
			MiniTablineCurrent = { fmt = "bold", fg = "white", bg = "grey" },
		},
	},
	config = function(_, opts)
		require("onedark").setup(opts)
		require("onedark").load()
	end,
}
