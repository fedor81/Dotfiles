require "nvchad.options"

vim.opt.relativenumber = true
vim.opt.mouse = "a"                    -- Возможность использовать мышку
vim.opt.mousefocus = true
-- vim.opt.so = 10

vim.opt.swapfile = false               -- Отключить swap файлы nvim

-- Indent Settings
vim.opt.expandtab = true               -- Превратить все tab в пробелы
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true             -- Копировать отступ на новой строке
vim.opt.cindent = true                 -- Автоотступы
vim.opt.smarttab = true                -- Tab перед строкой вставит shiftwidht количество табов

vim.g.ale_enable = 1 -- Вы можете включить ALE
