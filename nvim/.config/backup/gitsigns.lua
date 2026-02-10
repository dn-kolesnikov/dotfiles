return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre", -- Загружать плагин при открытии файла
	opts = {
		-- Основные настройки
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		current_line_blame = true, -- Включить отображение информации о коммите для текущей строки
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- Позиция виртуального текста (в конце строки)
			delay = 1000, -- Задержка перед отображением (в миллисекундах)
		},
		watch_gitdir = {
			interval = 1000, -- Интервал обновления статуса гита (в миллисекундах)
			follow_files = true,
		},
	},
	-- keys = {
	-- 	{ ']c',         function() require('gitsigns').nav_hunk("next") end,            desc = "Next Hunk" },
	-- 	{ '[c',         function() require('gitsigns').nav_hunk("prev") end,            desc = "Previous Hunk" },
	-- 	{ '<leader>hs', function() require('gitsigns').stage_hunk() end,                desc = "Stage Hunk" },
	-- 	{ '<leader>hr', function() require('gitsigns').reset_hunk() end,                desc = "Reset Hunk" },
	-- 	{ '<leader>hS', function() require('gitsigns').stage_buffer() end,              desc = "Stage Buffer" },
	-- 	{ '<leader>hu', function() require('gitsigns').stage_hunk() end,                desc = "Undo Stage Hunk" },
	-- 	{ '<leader>hR', function() require('gitsigns').reset_buffer() end,              desc = "Reset Buffer" },
	-- 	{ '<leader>hp', function() require('gitsigns').preview_hunk() end,              desc = "Preview Hunk" },
	-- 	{ '<leader>hb', function() require('gitsigns').blame_line({ full = true }) end, desc = "Blame Line" },
	-- 	{ '<leader>tb', function() require('gitsigns').toggle_current_line_blame() end, desc = "Toggle Blame Line" },
	-- 	{ '<leader>hd', function() require('gitsigns').diffthis() end,                  desc = "Diff This" },
	-- 	{ '<leader>hD', function() require('gitsigns').diffthis('~') end,               desc = "Diff This (~)" },
	-- },
}
