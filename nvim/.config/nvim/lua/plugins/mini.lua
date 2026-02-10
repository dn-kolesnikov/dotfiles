return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup()
		-- require("mini.align").setup()
		-- require("mini.animate").setup()
		-- require("mini.base16").setup()
		-- require("mini.basics").setup()
		require("mini.bracketed").setup()
		require("mini.bufremove").setup()
		local miniclue = require("mini.clue")
		miniclue.setup({
			clues = {
				miniclue.gen_clues.square_brackets(),
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.windows({ submode_resize = true }),
				miniclue.gen_clues.z(),
				{ mode = "n", keys = "<Leader>b", desc = "+Buffer" },
				{ mode = "n", keys = "<Leader>e", desc = "+Explore/Edit" },
				{ mode = "n", keys = "<Leader>f", desc = "+Find" },
				{ mode = "n", keys = "<Leader>l", desc = "+Language" },
				{ mode = "n", keys = "<Leader>w", desc = "+Workspace" },
			},
			triggers = {
				-- Leader key triggers (all custom keymaps start with <Leader> / <Space>)
				-- Usage: Press <Space> to see available Leader commands
				{ mode = "n", keys = "<Leader>" }, -- Normal mode: show Leader commands
				{ mode = "x", keys = "<Leader>" }, -- Visual mode: show visual Leader commands

				-- Square bracket navigation (mini.bracketed)
				-- Usage: Press [ or ] to navigate to previous/next items (buffers, diagnostics, etc.)
				{ mode = "n", keys = "[" }, -- Normal mode: navigate backwards
				{ mode = "n", keys = "]" }, -- Normal mode: navigate forwards
				{ mode = "x", keys = "[" }, -- Visual mode: navigate backwards
				{ mode = "x", keys = "]" }, -- Visual mode: navigate forwards

				-- 'g' key - movement and goto commands
				-- Usage: Press 'g' to see all g-commands (gd=definition, gi=implementation, etc.)
				{ mode = "n", keys = "g" }, -- Normal mode: goto/movement commands
				{ mode = "x", keys = "g" }, -- Visual mode: goto/movement commands

				-- Window management commands
				-- Usage: Press Ctrl-W to resize, navigate, or manage windows
				-- With submode_resize=true: stay in window mode while resizing with +/- etc.
				{ mode = "n", keys = "<C-w>" },

				-- Fold manipulation and scrolling commands
				-- Usage: Press 'z' to open/close folds, adjust view (zt=top, zz=center, zb=bottom)
				{ mode = "n", keys = "z" }, -- Normal mode: fold and view commands
				{ mode = "x", keys = "z" }, -- Visual mode: fold and view commands
			},
		})
		-- require("mini.colors").setup()
		require("mini.comment").setup()
		-- require("mini.completion").setup()
		require("mini.cursorword").setup()
		-- require("mini.deps").setup()
		-- require("mini.diff").setup()
		-- require("mini.extra").setup()
		require("mini.files").setup({ windows = { preview = true, width_preview = 80 } })
		-- require("mini.fuzzy").setup()
		-- require("mini.git").setup()
		require("mini.hipatterns").setup()
		-- require("mini.hues").setup()
		require("mini.icons").setup()
		require("mini.indentscope").setup()
		-- require("mini.jump").setup()
		-- require("mini.jump2d").setup()
		require("mini.keymap").setup()
		require("mini.map").setup()
		require("mini.misc").setup()
		require("mini.move").setup()
		require("mini.notify").setup()
		require("mini.operators").setup()
		require("mini.pairs").setup({ modes = { command = true } })
		-- require("mini.pick").setup()
		-- require("mini.sessions").setup()
		-- require("mini.snippets").setup()
		require("mini.splitjoin").setup()
		-- require("mini.starter").setup()
		require("mini.statusline").setup()
		require("mini.surround").setup()
		require("mini.tabline").setup()
		-- require("mini.test").setup()
		require("mini.trailspace").setup()
		-- require("mini.visits").setup()
	end,
}
