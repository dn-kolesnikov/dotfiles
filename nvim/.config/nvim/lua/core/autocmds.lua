-- RU: Глобальная группа для автокоманд.
local userGroup = vim.api.nvim_create_augroup("BlazingUserConfiguration", { clear = true })

-- RU: Восстановление позиции курсора при открытии файла
-- EN: Restore cursor position when opening file
vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Restore cursor position when opening file",
	group = userGroup,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- RU: Настройки для quickfix окна
-- EN: Settings for quickfix window
vim.api.nvim_create_autocmd("FileType", {
	desc = "Settings for quickfix window",
	group = userGroup,
	pattern = "qf",
	callback = function()
		vim.opt_local.wrap = false
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.cursorline = true
	end,
})

-- RU: Автоматическое закрытие некоторых типов окон по клавише q
-- EN: Auto-close certain window types with q key
vim.api.nvim_create_autocmd("FileType", {
	desc = "Auto-close certain window types with q key",
	group = userGroup,
	pattern = {
		"qf",
		"help",
		"man",
		"lspinfo",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"PlenaryTestPopup",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- RU: Подсветка при копировании текста
-- EN: Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = userGroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- RU: Настройки автодополнения при присоединении языкового сервера
-- EN: Setup LSP completion when language server attaches
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	desc = "Setup LSP completion when language server attaches",
-- 	group = userGroup,
-- 	callback = function(args)
-- 		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
-- 		if not client then
-- 			return
-- 		end
--
-- 		local bufnr = args.buf
--
-- 		-- Включение completion
-- 		if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
-- 			-- По умолчанию варианты дополнения показываются при вводе любого символа
-- 			local chars = {}
-- 			for i = 32, 126 do
-- 				table.insert(chars, string.char(i))
-- 			end
-- 			client.server_capabilities.completionProvider.triggerCharacters = chars
--
-- 			vim.lsp.completion.enable(true, client.id, bufnr, {
-- 				autotrigger = true,
-- 			})
-- 		end
-- 	end,
-- })
