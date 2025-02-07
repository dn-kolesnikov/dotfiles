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

-- map space to leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- map "qq" to ESC
vim.keymap.set({ "i", "v" }, "qq", "<esc>")

-- Go to tab by number
-- vim.keymap.set({ "n", "i", "v" }, "<leader>1", "<cmd>bfirst<cr>")
-- vim.keymap.set({ "n", "i", "v" }, "<leader>0", "<cmd>blast<cr>")
-- vim.keymap.set({ "n", "i", "v" }, "<leader><tab>", "<cmd>bnext<cr>")
