local status_ok, mini_statusline = pcall(require, "mini.statusline")
if status_ok then
	mini_statusline.setup({
		content = {
			active = function()
				-- stylua: ignore start
				local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
				local spell         = vim.wo.spell and (MiniStatusline.is_truncated(120) and 'S' or 'SPELL') or ''
				local wrap          = vim.wo.wrap  and (MiniStatusline.is_truncated(120) and 'W' or 'WRAP')  or ''
				local git           = MiniStatusline.section_git({ trunc_width = 75 })
				-- Default diagnstics icon has some problems displaying in Kitty terminal
				local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75, icon = '' })
				local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
				local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
				local searchcount   = MiniStatusline.section_searchcount({ trunc_width = 75})
				local location      = MiniStatusline.section_location({ trunc_width = 75 })

				-- Usage of `MiniStatusline.combine_groups()` ensures highlighting and
				-- correct padding with spaces between groups (accounts for 'missing'
				-- sections, etc.)
				return MiniStatusline.combine_groups({
					{ hl = mode_hl,                  strings = { mode, spell, wrap } },
					{ hl = 'MiniStatuslineDevinfo',  strings = { git, diagnostics } },
					'%<', -- Mark general truncate point
					{ hl = 'MiniStatuslineFilename', strings = { filename } },
					'%=', -- End left alignment
					{ hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
					{ hl = mode_hl,                  strings = { searchcount, location } },
				})
				-- stylua: ignore end
			end,
		},
	})
end

local status_ok, mini_tabline = pcall(require, "mini.tabline")
if status_ok then
	mini_tabline.setup()
end

local status_ok, mini_comment = pcall(require, "mini.comment")
if status_ok then
	mini_comment.setup()
end

local status_ok, mini_cursorword = pcall(require, "mini.cursorword")
if status_ok then
	mini_cursorword.setup()
end

local status_ok, mini_pairs = pcall(require, "mini.pairs")
if status_ok then
	mini_pairs.setup({ modes = { insert = true, command = true, terminal = true } })
end

local status_ok, mini_surround = pcall(require, "mini.surround")
if status_ok then
	mini_surround.setup()
end

local status_ok, mini_trailspace = pcall(require, "mini.trailspace")
if status_ok then
	mini_trailspace.setup()
end
