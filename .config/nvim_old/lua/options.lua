require "nvchad.options"

vim.opt.relativenumber = true
vim.opt.mouse = "a" -- Возможность использовать мышку
vim.opt.mousefocus = true
-- vim.opt.so = 10

-- За фолды отвечает nvim-ufo
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Folds "мои" настройки
-- vim.opt.foldmethod = "indent"
-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 1 -- фолды первого уровня будут закрыты по дефолту
-- vim.g.markdown_folding = 1 -- enable markdown folding
-- vim.opt.foldnestmax = 4 -- Максимальная глубина вложенности
-- -- vim.opt.foldtext = "" -- Отоюражение(форматирование) кода внутри фолда
-- -- vim.opt.fillchars = { fold = " " } -- Nvim заполняет всю строку до конца экрана этим символом

vim.opt.termguicolors = true
vim.opt.swapfile = false -- Отключить swap файлы nvim
vim.opt.ignorecase = true -- При поиске
vim.opt.smartcase = true

-- Отступы и табы
local tab_width = 4
vim.opt.expandtab = true -- Превратить все tab в пробелы
vim.opt.shiftwidth = tab_width
vim.opt.tabstop = tab_width
vim.opt.softtabstop = tab_width
vim.opt.smartindent = true -- Копировать отступ на новой строке
vim.opt.cindent = true -- Автоотступы
vim.opt.smarttab = true -- Tab перед строкой вставит shiftwidht количество табов
vim.opt.wrap = false -- Перенос на новую строку
