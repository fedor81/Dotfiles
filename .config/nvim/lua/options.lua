require "nvchad.options"

vim.opt.relativenumber = true
vim.opt.mouse = "a" -- Возможность использовать мышку
vim.opt.mousefocus = true
-- vim.opt.so = 10

vim.opt.swapfile = false -- Отключить swap файлы nvim
vim.opt.ignorecase = true -- При поиске
vim.opt.smartcase = true

local tab_width = 4

vim.opt.expandtab = true -- Превратить все tab в пробелы
vim.opt.shiftwidth = tab_width
vim.opt.tabstop = tab_width
vim.opt.softtabstop = tab_width
vim.opt.smartindent = true -- Копировать отступ на новой строке
vim.opt.cindent = true -- Автоотступы
vim.opt.smarttab = true -- Tab перед строкой вставит shiftwidht количество табов
vim.opt.wrap = false -- Перенос на новую строку
