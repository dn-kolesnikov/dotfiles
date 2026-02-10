return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "nvim-neotest/nvim-nio" },
		{ "leoluz/nvim-dap-go", opts = { delve = { args = { "--check-go-version=false" } } } },
		{ "theHamsta/nvim-dap-virtual-text", opts = {} },
		{
			"rcarriga/nvim-dap-ui",
			opts = {
				expand_lines = true,
				control = { enabled = false },
				floating = { border = "rounded" },
				render = {
					max_type_length = 60,
					max_value_lines = 200,
				},
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 1.0 },
						},
						size = 15,
						position = "bottom",
					},
				},
			},
		},
	},
	opts = {},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.after.event_initialized.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.disconnect.dapui_config = function()
			dapui.close()
		end
	end,
	keys = {
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Start Debug",
		},
		{
			"<F6>",
			function()
				require("dap").step_into()
			end,
			desc = "Step Into",
		},
		{
			"<F7>",
			function()
				require("dap").step_out()
			end,
			desc = "Step Out",
		},
		{
			"<F8>",
			function()
				require("dap").step_over()
			end,
			desc = "Step Over",
		},
		{
			"<F2>",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<F3>",
			function()
				require("dap").clear_breakpoints()
			end,
			desc = "Clear Breakpoints",
		},
		{
			"<F4>",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug UI toggle",
		},
	},
}
