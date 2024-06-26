require "nvchad.mappings"

local map = vim.keymap.set

-- map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", {desc = "Save file"})
map("i", "jj", "<ESC>")
map("n", "<leader>cx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close All Buffers" })
-- map("n", ";", ":", { desc = "CMD enter command mode" })

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
  sidebar.open()
end, { desc = "Open debugging sidebar" })

-- Debug Python
map("n", "<Leader>dpr", function()
  require("dap-python").test_method()
end, { desc = "Debug Python Run" })

-- Trouble
map("n", "<leader>qx", "<cmd>TroubleToggle<CR>", { desc = "Open Trouble" })
map("n", "<leader>qw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Open Workspace Trouble" })
map("n", "<leader>qd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Open Document Trouble" })
map("n", "<leader>qq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Open Quickfix" })
map("n", "<leader>ql", "<cmd>TroubleToggle loclist<CR>", { desc = "Open Location List" })
map("n", "<leader>qt", "<cmd>TodoTrouble<CR>", { desc = "Open Todo Trouble" })

-- Rename
map("n", "<leader>rn", ":IncRename ", { desc = "Rename word on cursor" })

-- Codeium
-- map("i", "<C-g>", function()
--   return vim.fn["codeium#Accept"]()
-- end, { expr = true, silent = true })
-- map("i", "<c-;>", function()
--   return vim.fn["codeium#CycleCompletions"](1)
-- end, { expr = true, silent = true })
-- map("i", "<c-,>", function()
--   return vim.fn["codeium#CycleCompletions"](-1)
-- end, { expr = true, silent = true })
-- map("i", "<c-x>", function()
--   return vim.fn["codeium#Clear"]()
-- end, { expr = true, silent = true })

-- Telescope
map("n", "<leader>fz", "<cmd>Telescope zoxide list<cr>", { desc = "Zoxide" })
map("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })

-- Важная настройка
map("n", "<Left>", ":echo 'Use h'<CR>")
map("n", "<Right>", ":echo 'Use l'<CR>")
map("n", "<Up>", ":echo 'Use k'<CR>")
map("n", "<Down>", ":echo 'Use j'<CR>")
