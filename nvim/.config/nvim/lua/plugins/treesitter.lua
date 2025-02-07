return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	build = ":TSUpdate",
	opts = function()
		local ts_config = require("nvim-treesitter.configs")
		ts_config.setup({
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"dockerfile",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"gotmpl",
				"gowork",
				"hjson",
				"html",
				"http",
				"javascript",
				"jsdoc",
				"json",
				"json5",
				"jsonc",
				"jsonnet",
				"lua",
				"luadoc",
				"make",
				"markdown",
				"markdown_inline",
				"nginx",
				"printf",
				"python",
				"query",
				"regex",
				"sql",
				"tmux",
				"toml",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				use_languagetree = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = false,
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						['aa'] = '@parameter.outer',
						['ia'] = '@parameter.inner',
						['af'] = '@function.outer',
						['if'] = '@function.inner',
						['ac'] = '@class.outer',
						['ic'] = '@class.inner',
						['ii'] = '@conditional.inner',
						['ai'] = '@conditional.outer',
						['il'] = '@loop.inner',
						['al'] = '@loop.outer',
						['at'] = '@comment.outer',
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						[']f'] = '@function.outer',
						[']]'] = '@class.outer',
					},
					goto_next_end = {
						[']F'] = '@function.outer',
						[']['] = '@class.outer',
					},
					goto_previous_start = {
						['[f'] = '@function.outer',
						['[['] = '@class.outer',
					},
					goto_previous_end = {
						['[F'] = '@function.outer',
						['[]'] = '@class.outer',
					},
				},
				swap = {
					enable = true,
					swap_next = {
						['<leader>a'] = '@parameter.inner',
					},
					swap_previous = {
						['<leader>A'] = '@parameter.inner',
					},
				},
			},
		})
	end,
}
