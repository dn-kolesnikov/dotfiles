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
				"lua",
				"luadoc",
				"make",
				"markdown",
				"markdown_inline",
				"nginx",
				"printf",
				"python",
				"qmljs",
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

			-- Установка парсеров в асинхронном режиме
			-- false: установка происходит в фоновом режиме, не блокируя интерфейс Neovim
			-- true: блокирующая установка - вы увидите прогресс, но Neovim будет "заморожен"
			sync_install = false,

			-- Автоматическая установка парсеров для новых языков
			-- true: если открыть файл с неподдерживаемым языком, Treesitter автоматически
			--       попытается найти и установить подходящий парсер
			-- false: нужно вручную устанавливать парсеры через :TSInstall
			auto_install = false,

			highlight = {
				-- Включение улучшенной подсветки синтаксиса на основе AST (Abstract Syntax Tree)
				-- Заменяет стандартную regex-подсветку Vim на более точную
				enable = true,

				-- Использование улучшенного движка подсветки
				-- Обеспечивает более стабильную и точную подсветку для всех языков
				use_languagetree = true,

				-- Отключение старой regex-подсветки Vim
				-- false: использовать только Treesitter для подсветки (рекомендуется)
				-- true: дублировать подсветку (может вызывать конфликты)
				additional_vim_regex_highlighting = false,
			},

			textobjects = {
				-- Включение работы с текстовыми объектами (функции, классы, блоки)
				-- Позволяет использовать команды типа: vaf (visual around function), dif (delete inside function)
				-- Требует установки плагина nvim-treesitter-textobjects
				enable = true,
			},

			refactor = {
				highlight_definitions = {
					-- Подсветка всех мест использования переменной/функции при наведении курсора
					-- Полезно для отслеживания scope и рефакторинга
					enable = true,

					-- Автоматическое снятие подсветки при перемещении курсора
					-- true: подсветка только для текущего элемента под курсором
					-- false: подсветка сохраняется до явного сброса
					clear_on_cursor_move = true,
				},
				highlight_current_scope = {
					-- Подсветка текущей области видимости (scope)
					-- false: отключено, так как может отвлекать при обычном редактировании
					-- true: визуально выделяет текущий блок кода (функция, класс, etc.)
					enable = false,
				},
			},

			context_commentstring = {
				-- Автоматическое определение правильного стиля комментариев для разных контекстов
				-- Например: в Vue файле правильно подставляет <!-- --> для HTML и // для JavaScript
				enable = true,

				-- Отключение автоматических команд для обновления комментариев
				-- false: плагины комментариев (like Comment.nvim) сами управляют обновлением
				-- true: Treesitter автоматически обновляет стиль комментариев
				enable_autocmd = false,
			},

			indent = {
				-- Включение автоматических отступов на основе синтаксического дерева
				-- Обеспечивает более точные отступы для сложных конструкций
				-- Работает лучше чем встроенный autoindent Vim
				enable = true,
			},

			incremental_selection = {
				-- Постепенное выделение элементов синтаксического дерева
				-- false: отключено (может мешать при обычном редактировании)
				-- true: позволяет постепенно выделять большие блоки кода с помощью горячих клавиш
				enable = false,
			},

			-- Зарезервировано для дополнительных модулей Treesitter
			-- Обычно пустое, используется для кастомных расширений
			modules = {},

			-- Список языков, которые НЕ должны устанавливаться автоматически
			-- Пустой массив = устанавливать все возможные парсеры
			-- Пример: {"javascript", "python"} - пропустить эти языки при автоматической установке
			ignore_install = {},
		})
	end,
}
