require "nvchad.mappings"

local map = vim.keymap.set

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", {desc = "Save file"})
map("i", "jj", "<ESC>")
map("n", "<leader>cx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close All Buffers" })

-- Удаление x не трогает буфер обмена
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true })

-- NvimTree
-- map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "NvimTree Toggle Window" })

-- Русская раскладка
map("n", "ш", "i")
map("n", "р", "h")
map("n", "о", "j")
map("n", "л", "k")
map("n", "д", "l")
map("n", "ч", "x")
map("n", "ц", "w")
map("n", "и", "b")

-- Emmet
map({ "n", "v" }, "<leader>xe", function()
  require("nvim-emmet").wrap_with_abbreviation()
end, { desc = "Open Emmet" })

-- Debug
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
map("n", "<leader>ds", function()
  require("dap").continue()
end, { desc = "Start" })
map("n", "<leader>dn", function()
  require("dap").step_over()
end, { desc = "Step Over" })
map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "Toggle Debug UI" })
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.toggle()
end, { desc = "Open debugging sidebar" })

-- Debug Python
map("n", "<Leader>dpr", function()
  require("dap-python").test_method()
end, { desc = "Debug Python Run" })

-- Trouble
map("n", "<leader>qx", "<cmd>Trouble<CR>", { desc = "Open Trouble" })
map("n", "<leader>qt", "<cmd>Trouble todo focus<CR>", { desc = "Open Todo Trouble" })
map("n", "<leader>qd", "<cmd>Trouble diagnostics toggle focus<cr>", { desc = "Diagnostics Trouble" })
map("n", "<leader>qs", "<cmd>Trouble symbols toggle focus<cr>", { desc = "Symbols Trouble" })
map("n", "<leader>ql", "<cmd>Trouble loclist toggle focus<cr>", { desc = "Location List Trouble" })
map("n", "<leader>qq", "<cmd>Trouble qflist toggle focus<cr>", { desc = "Quickfix List Trouble" })

-- Rename
map("n", "<leader>rn", ":IncRename ", { desc = "Rename word on cursor" })

-- Codeium
vim.keymap.set("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-;>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-,>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })

-- Telescope
map("n", "<leader>fz", "<cmd>Telescope zoxide list<cr>", { desc = "Telescope Zoxide" })
map("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope find in current buffer" })

-- Git
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
map("n", "<leader>ng", function()
  require("neogit").open()
end, { desc = "Open NeoGit" })

-- Rust
map("n", "<leader>rur", function()
  vim.cmd.RustLsp "runnables"
end, { desc = "RustLsp runnanles" })
map("n", "<leader>ruc", function()
  vim.cmd.RustLsp "codeAction"
end, { desc = "RustLsp Code Action" })

-- Важная настройка
-- map("n", "<Left>", ":echo 'Use h'<CR>")
-- map("n", "<Right>", ":echo 'Use l'<CR>")
-- map("n", "<Up>", ":echo 'Use k'<CR>")
-- map("n", "<Down>", ":echo 'Use j'<CR>")
