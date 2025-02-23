vim.api.nvim_create_autocmd('filetype', {
	pattern = 'NvimTree',
	desc = 'Mappings for NvimTree',
	callback = function()
		-- Yank marked files
		vim.keymap.set('n', 'bgy',
			function()
				local api = require 'nvim-tree.api'
				local marks = api.marks.list()
				if #marks == 0 then
					print('No items marked')
					return
				end
				local absolute_file_paths = ''
				for _, mark in ipairs(marks) do
					absolute_file_paths = absolute_file_paths .. mark.absolute_path .. '\n'
				end
				-- Using system registers for multi-instance support.
				vim.fn.setreg("+", absolute_file_paths)
				print('Yanked ' .. #marks .. ' items')
			end,
			{ remap = true, buffer = true })

		-- Paste files
		vim.keymap.set('n', 'gp',
			function()
				local api = require 'nvim-tree.api'
				local source_paths = {}
				for path in vim.fn.getreg('+'):gmatch('[^\n%s]+') do
					source_paths[#source_paths + 1] = path
				end
				local node = api.tree.get_node_under_cursor()
				local is_folder = node.fs_stat and node.fs_stat.type == 'directory' or false
				local target_path = is_folder and node.absolute_path or
				    vim.fn.fnamemodify(node.absolute_path, ":h")
				for _, source_path in ipairs(source_paths) do
					vim.fn.system { 'cp', '-R', source_path, target_path }
				end
				api.tree.reload()
				print('Pasted ' .. #source_paths .. ' items')
			end,
			{ remap = true, buffer = true })
	end
})

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		filters = {
			dotfiles = false,
			git_ignored = false,
		},
		disable_netrw = true,
		hijack_cursor = true,
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = false,
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		view = {
			width = 50,
			preserve_window_proportions = true,
		},
		renderer = {
			root_folder_label = false,
			highlight_git = true,
			indent_markers = {
				enable = true,
			},
			icons = {
				glyphs = {
					default = "󰈚",
					folder = {
						default = "",
						empty = "",
						empty_open = "",
						open = "",
						symlink = "",
					},
					git = {
						unmerged = "",
					},
				},
			},
		},
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree toggle" },
	},
}
