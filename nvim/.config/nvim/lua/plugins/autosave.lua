return {
	"okuuva/auto-save.nvim",
	cmd = "ASToggle",
	event = {
		"InsertLeave",
		"TextChanged",
	},
	opts = { debounce_delay = 2000 },
}
