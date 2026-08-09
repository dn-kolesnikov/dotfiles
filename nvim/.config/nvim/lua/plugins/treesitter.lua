return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup()

		-- Установка парсеров в фоновом режиме (асинхронно, не блокирует UI)
		local parsers = {
			"bash",
			"c",
			"comment",
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
			"html",
			"http",
			"javascript",
			"json",
			"kdl",
			"latex",
			"lua",
			"luadoc",
			"make",
			"markdown",
			"markdown_inline",
			"mermaid",
			"nginx",
			"printf",
			"python",
			"qmljs",
			"query",
			"regex",
			"sql",
			"toml",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
		}
		require("nvim-treesitter").install(parsers)

		-- Подсветка синтаксиса на основе AST.
		-- Neovim автоматически включает её через `vim.treesitter.start()`,
		-- если парсер для языка установлен.
		vim.api.nvim_create_autocmd("FileType", {
			desc = "Enable treesitter highlighting",
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})

		-- Отступы на основе дерева синтаксиса (экспериментально)
		vim.api.nvim_create_autocmd("FileType", {
			desc = "Enable treesitter indentation",
			callback = function(args)
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
