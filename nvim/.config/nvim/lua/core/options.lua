-- UI
vim.opt.mouse = "a" -- use mouse in all modes
vim.opt.cmdheight = 0 -- command line height (0 - hide when not in use)
vim.opt.laststatus = 3 -- always and ONLY one window has status line
vim.opt.signcolumn = "yes" -- always show the sign column to
vim.opt.cursorline = true -- highlight current line
vim.opt.textwidth = 120 -- maximum text width
vim.opt.colorcolumn = "+1" -- highlight column after 'textwidth'
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.termguicolors = true -- enable 24-bit colors
vim.opt.winborder = "rounded" -- use rounded borders for floating windows
vim.opt.wrap = false -- disable line wrapping
vim.opt.scrolloff = 10 -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8 -- keep 8 columns left/right of cursor
vim.opt.ruler = false -- don't show cursor coordinates
vim.opt.pumheight = 10 -- make popup menu smaller
vim.opt.hidden = true -- allow hidden buffers (keep unsaved changes in background)

-- Search and case
vim.opt.hlsearch = false -- don't highlight all search matches
vim.opt.ignorecase = true -- case sensitive search
vim.opt.showmatch = true -- show matching brackets
vim.opt.smartcase = true -- ignore case only if search is lowercase

-- Editing
vim.opt.swapfile = false -- don't use swap files for buffers
vim.opt.undofile = true -- enable undo/redo persistence

-- Window system
vim.opt.splitbelow = true -- new windows open below current
vim.opt.splitright = true -- new windows open right of current

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- use system clipboard

-- Built-in completion
vim.opt.completeopt = {
	"menuone",
	"popup",
	"noselect",
}

-- Spell check
-- run `lua require("nvim.spellfile").get("en,ru")` for download dictionaries
-- vim.opt.spell = true
vim.opt.spelllang = { "en", "ru" } -- languages for spell checking
vim.opt.spelloptions = "camel" -- treat camelCase word parts as separate words

-- Neovim has built-in support for showing diagnostic messages. This configures
-- a more conservative display while still being useful.
-- See `:h vim.diagnostic` and `:h vim.diagnostic.config()`.
vim.diagnostic.config({
	-- Show signs on top of any other sign, but only for warnings and errors
	signs = {
		priority = 9999,
		Severity = {
			min = "WARN",
			max = "ERROR",
		},
	},

	-- Show all diagnostics as underline (for their messages type `<Leader>ld`)
	underline = {
		Severity = {
			min = "HINT",
			max = "ERROR",
		},
	},

	-- Show more details immediately for errors on the current line
	virtual_lines = {
		current_line = true,
		Severity = {
			min = "ERROR",
			max = "ERROR",
		},
	},

	-- Don't update diagnostics when typing
	update_in_insert = false,

	-- Sort diagnostics by severity level in all displays
	-- Order: ERROR (highest) → WARN → INFO → HINT (lowest)
	-- This ensures critical issues appear first in diagnostic lists and hover windows
	severity_sort = true,

	float = {
		-- Use rounded corners for diagnostic hover windows
		-- Border styles: 'none', 'single', 'double', 'rounded', 'solid', 'shadow'
		-- 'rounded' provides modern, visually appealing corners
		border = "rounded",

		-- Show diagnostic source only when multiple diagnostics exist
		-- Options: 'always' (always show), 'if_many' (show when >1 diagnostic), 'never' (hide)
		-- 'if_many' reduces clutter for single issues but clarifies sources during multiple errors
		source = "if_many",
	},
})
