-- Russian keyboard mappings
local langmap_keys = {
	"ёЁ;`~",
	"№;#",
	"йЙ;qQ",
	"цЦ;wW",
	"уУ;eE",
	"кК;rR",
	"еЕ;tT",
	"нН;yY",
	"гГ;uU",
	"шШ;iI",
	"щЩ;oO",
	"зЗ;pP",
	"хХ;[{",
	"ъЪ;]}",
	"фФ;aA",
	"ыЫ;sS",
	"вВ;dD",
	"аА;fF",
	"пП;gG",
	"рР;hH",
	"оО;jJ",
	"лЛ;kK",
	"дД;lL",
	[[жЖ;\;:]],
	[[эЭ;"\"]],
	"яЯ;zZ",
	"чЧ;xX",
	"сС;cC",
	"мМ;vV",
	"иИ;bB",
	"тТ;nN",
	"ьЬ;mM",
	[[бБ;\,<]],
	"юЮ;.>",
}
vim.opt.langmap = table.concat(langmap_keys, ",")

-- Функция для удобного создания маппингов
local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Отключение стрелок для принуждения к использованию hjkl
map("n", "<Up>", "<Nop>")
map("n", "<Down>", "<Nop>")
map("n", "<Left>", "<Nop>")
map("n", "<Right>", "<Nop>")
map("i", "<Up>", "<Nop>")
map("i", "<Down>", "<Nop>")
map("i", "<Left>", "<Nop>")
map("i", "<Right>", "<Nop>")

-- Умные отступы
map("n", "<Tab>", ">>", { desc = "Indent line" })
map("n", "<S-Tab>", "<<", { desc = "Unindent line" })
map("v", "<Tab>", ">gv", { desc = "Indent selection" })
map("v", "<S-Tab>", "<gv", { desc = "Unindent selection" })

-- Улучшенное перемещение в режиме вставки
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })

-- Быстрое перемещение к началу/концу строки
map("n", "H", "^", { desc = "Go to first non-blank character" })
map("n", "L", "$", { desc = "Go to end of line" })
map("v", "H", "^", { desc = "Go to first non-blank character" })
map("v", "L", "$", { desc = "Go to end of line" })

-- Центрирование при навигации
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
map("n", "n", "nzzzv", { desc = "Next search result and center" })
map("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Улучшенная навигация в командной строке
map("c", "<C-a>", "<Home>", { desc = "Go to beginning of line" })
map("c", "<C-e>", "<End>", { desc = "Go to end of line" })
map("c", "<C-h>", "<Left>", { desc = "Move left" })
map("c", "<C-l>", "<Right>", { desc = "Move right" })
map("c", "<C-j>", "<Down>", { desc = "Next command" })
map("c", "<C-k>", "<Up>", { desc = "Previous command" })

-- ┌──────────────────────────────────────────┐
-- │ Leader mappings                          │
-- └──────────────────────────────────────────┘

local builtin = require("telescope.builtin")

-- b is for 'Buffer'. Common usage:
map("n", "<leader>bd", "<Cmd>lua MiniBufremove.delete()<CR>", { desc = "Delete" })
map("n", "<leader>bw", "<Cmd>lua MiniBufremove.wipeout()<CR>", { desc = "Wipeout" })
map("n", "<leader>bl", builtin.buffers, { desc = "List" })

---
-- e is for 'Explore' and 'Edit'. Common usage:
map("n", "<leader>ed", "<Cmd>lua MiniFiles.open()<CR>", { desc = "Directory" })
map("n", "<leader>ef", "<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", { desc = "File directory" })
map("n", "<leader>en", "<Cmd>lua MiniNotify.show_history()<CR>", { desc = "Notifications" })

-- f is for `Find`. Common usege:
map("n", "<leader>fg", builtin.live_grep, { desc = "Grep live" })
map("n", "<leader>ff", builtin.find_files, { desc = "Files" })

-- l is for 'Language'. Common usage:
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>lR", builtin.lsp_references, { desc = "References" })
map("n", "<leader>li", builtin.lsp_implementations, { desc = "Implementation" })
map("n", "<leader>ls", builtin.lsp_definitions, { desc = "Source definition" })
map("n", "<leader>lt", builtin.lsp_type_definitions, { desc = "Type definition" })
map("n", "<leader>ld", builtin.diagnostics, { desc = "Diagnostic popup" })

local formatting_cmd = '<Cmd>lua require("conform").format({ lsp_fallback = true })<CR>'
map({ "n", "v" }, "<leader>lf", formatting_cmd, { desc = "Format buffer" })

-- Workspace folder management
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
map("n", "<leader>wl", function()
	vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()), vim.log.levels.INFO)
end, { desc = "List workspace folders" })
