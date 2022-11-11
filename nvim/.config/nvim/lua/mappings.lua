-- Russian keyboard mappings
local langmap_keys = {
	"ёЁ;`~", "№;#",
	"йЙ;qQ", "цЦ;wW", "уУ;eE", "кК;rR", "еЕ;tT", "нН;yY", "гГ;uU", "шШ;iI", "щЩ;oO", "зЗ;pP", "хХ;[{", "ъЪ;]}",
	"фФ;aA", "ыЫ;sS", "вВ;dD", "аА;fF", "пП;gG", "рР;hH", "оО;jJ", "лЛ;kK", "дД;lL", [[жЖ;\;:]], [[эЭ;"\"]],
	"яЯ;zZ", "чЧ;xX", "сС;cC", "мМ;vV", "иИ;bB", "тТ;nN", "ьЬ;mM", [[бБ;\,<]], "юЮ;.>",
}
vim.opt.langmap = table.concat(langmap_keys, ",")

-- map space to leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- map "kj" to ESC
vim.keymap.set({"i", "v"},"kj","<esc>")

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

