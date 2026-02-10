return {
	{
		"nvim-mini/mini.nvim",
	},
	{
		-- Better Around/Inside textobjects
		--
		-- Examples
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		"nvim-mini/mini.ai",
		opts = {},
	},
	{
		"nvim-mini/mini.bracketed",
		opts = {},
	},
	{
		"nvim-mini/mini.comment",
		opts = {},
	},
	{
		"nvim-mini/mini.cursorword",
		opts = {},
	},
	{
		-- Autohighlight word under cursor with a customizable delay.
		-- Word boundaries are defined based on `:h 'iskeyword'` option.
		--
		-- It is not enabled by default because its effects are a matter of taste.
		-- Uncomment next line (use `gcc`) to enable.
		-- later(function() require('mini.cursorword').setup() end)

		-- Work with diff hunks that represent the difference between the buffer text and
		-- some reference text set by a source. Default source uses text from Git index.
		-- Also provides summary info used in developer section of 'mini.statusline'.
		-- Example usage:
		-- - `ghip` - apply hunks (`gh`) within *i*nside *p*aragraph
		-- - `gHG` - reset hunks (`gH`) from cursor until end of buffer (`G`)
		-- - `ghgh` - apply (`gh`) hunk at cursor (`gh`)
		-- - `gHgh` - reset (`gH`) hunk at cursor (`gh`)
		-- - `<Leader>go` - toggle overlay
		--
		-- See also:
		-- - `:h MiniDiff-overview` - overview of how module works
		-- - `:h MiniDiff-diff-summary` - available summary information
		-- - `:h MiniDiff.gen_source` - available built-in sources

		-- 	"nvim-mini/mini.diff",
		-- 	opts = {},
	},
	{
		-- Git integration for more straightforward Git actions based on Neovim's state.
		-- It is not meant as a fully featured Git client, only to provide helpers that
		-- integrate better with Neovim. Example usage:
		-- - `<Leader>gs` - show information at cursor
		-- - `<Leader>gd` - show unstaged changes as a patch in separate tabpage
		-- - `<Leader>gL` - show Git log of current file
		-- - `:Git help git` - show output of `git help git` inside Neovim
		--
		-- See also:
		-- - `:h MiniGit-examples` - examples of common setups
		-- - `:h :Git` - more details about `:Git` user command
		-- - `:h MiniGit.show_at_cursor()` - what information at cursor is shown
		-- "nvim-mini/mini-git",
		-- opts = {},
	},
	{
		"nvim-mini/mini.icons",
		opts = {},
	},
	{
		"nvim-mini/mini.files",
		opts = {
			windows = {
				preview = true,
				width_preview = 80,
			},
		},
		keys = {
			{
				"<leader>e",
				function()
					if not require("mini.files").close() then
						require("mini.files").open()
					end
				end,
				desc = "File Explorer",
			},
		},
	},
	{
		"nvim-mini/mini.pairs",
		opts = {
			modes = {
				command = true,
			},
		},
	},
	{
		-- Statusline. Sets `:h 'statusline'` to show more info in a line below window.
		-- Example usage:
		-- - Left most section indicates current mode (text + highlighting).
		-- - Second from left section shows "developer info": Git, diff, diagnostics, LSP.
		-- - Center section shows the name of displayed buffer.
		-- - Second to right section shows more buffer info.
		-- - Right most section shows current cursor coordinates and search results.
		--
		-- See also:
		-- - `:h MiniStatusline-example-content` - example of default content. Use it to
		--   configure a custom statusline by setting `config.content.active` function.
		"nvim-mini/mini.statusline",
		opts = {},
	},
	{
		-- Tabline. Sets `:h 'tabline'` to show all listed buffers in a line at the top.
		-- Buffers are ordered as they were created. Navigate with `[b` and `]b`.
		"nvim-mini/mini.tabline",
		opts = {},
	},
	{
		-- Surround actions: add/delete/replace/find/highlight. Working with surroundings
		-- is surprisingly common: surround word with quotes, replace `)` with `]`, etc.
		-- This module comes with many built-in surroundings, each identified by a single
		-- character. It searches only for surrounding that covers cursor and comes with
		-- a special "next" / "last" versions of actions to search forward or backward
		-- (just like 'mini.ai'). All text editing actions are dot-repeatable (see `:h .`).
		--
		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		--
		-- Example usage (this may feel intimidating at first, but after practice it
		-- becomes second nature during text editing):
		-- - `saiw)` - *s*urround *a*dd for *i*nside *w*ord parenthesis (`)`)
		-- - `sdf`   - *s*urround *d*elete *f*unction call (like `f(var)` -> `var`)
		-- - `srb[`  - *s*urround *r*eplace *b*racket (any of [], (), {}) with padded `[`
		-- - `sf*`   - *s*urround *f*ind right part of `*` pair (like bold in markdown)
		-- - `shf`   - *s*urround *h*ighlight current *f*unction call
		-- - `srn{{` - *s*urround *r*eplace *n*ext curly bracket `{` with padded `{`
		-- - `sdl'`  - *s*urround *d*elete *l*ast quote pair (`'`)
		-- - `vaWsa<Space>` - *v*isually select *a*round *W*ORD and *s*urround *a*dd
		--                    spaces (`<Space>`)
		"nvim-mini/mini.surround",
		opts = {},
	},
	{
		"nvim-mini/mini.trailspace",
		opts = {},
	},
	{
		-- Split and join arguments (regions inside brackets between allowed separators).
		-- It uses Lua patterns to find arguments, which means it works in comments and
		-- strings but can be not as accurate as tree-sitter based solutions.
		-- Each action can be configured with hooks (like add/remove trailing comma).
		-- Example usage:
		-- - `gS` - toggle between joined (all in one line) and split (each on a separate
		--   line and indented) arguments. It is dot-repeatable (see `:h .`).
		--
		-- See also:
		-- - `:h MiniSplitjoin.gen_hook` - list of available hooks
		"nvim-mini/mini.splitjoin",
		opts = {},
	},
	{
		-- Move any selection in any direction. Example usage in Normal mode:
		-- - `<M-j>`/`<M-k>` - move current line down / up
		-- - `<M-h>`/`<M-l>` - decrease / increase indent of current line
		--
		-- Example usage in Visual mode:
		-- - `<M-h>`/`<M-j>`/`<M-k>`/`<M-l>` - move selection left/down/up/right
		"nvim-mini/mini.move",
		opts = {},
	},
	{
		-- Visualize and work with indent scope. It visualizes indent scope "at cursor"
		-- with animated vertical line. Provides relevant motions and textobjects.
		-- Example usage:
		-- - `cii` - *c*hange *i*nside *i*ndent scope
		-- - `Vaiai` - *V*isually select *a*round *i*ndent scope and then again
		--   reselect *a*round new *i*indent scope
		-- - `[i` / `]i` - navigate to scope's top / bottom
		--
		-- See also:
		-- - `:h MiniIndentscope.gen_animation` - available animation rules
		"nvim-mini/mini.indentscope",
		opts = {},
	},
	{
		-- Jump to next/previous single character. It implements "smarter `fFtT` keys"
		-- (see `:h f`) that work across multiple lines, start "jumping mode", and
		-- highlight all target matches. Example usage:
		-- - `fxff` - move *f*orward onto next character "x", then next, and next again
		-- - `dt)` - *d*elete *t*ill next closing parenthesis (`)`)
		"nvim-mini/mini.jump",
		opts = {},
	},
	{
		-- Jump within visible lines to pre-defined spots via iterative label filtering.
		-- Spots are computed by a configurable spotter function. Example usage:
		-- - Lock eyes on desired location to jump
		-- - `<CR>` - start jumping; this shows character labels over target spots
		-- - Type character that appears over desired location; number of target spots
		--   should be reduced
		-- - Keep typing labels until target spot is unique to perform the jump
		--
		-- See also:
		-- - `:h MiniJump2d.gen_spotter` - list of available spotters
		"nvim-mini/mini.jump2d",
		opts = {},
	},
	{
		"nvim-mini/mini.notify",
		opts = {},
	},
}
