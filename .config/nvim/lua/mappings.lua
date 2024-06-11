require "nvchad.mappings"

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("i", "jj", "<ESC>")
map("n", "<leader>cx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close All Buffers" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Emmet
map({ "n", "v" }, "<leader>xe", function()
  require("nvim-emmet").wrap_with_abbreviation()
end, { desc = "Open Emmet" })

-- Debug
map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "Toggle Debug UI" })
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
map("n", "<leader>ds", function()
  require("dap").continue()
end, { desc = "Start" })
map("n", "<leader>dn", function()
  require("dap").step_over()
end, { desc = "Step Over" })

-- Debug Python
map("n", "<Leader>dpr", function()
  require("dap-python").test_method()
end, { desc = "Debug Python Run" })

-- Важная настройка
map("n", "<Left>", ":echo 'Use h'<CR>")
map("n", "<Right>", ":echo 'Use l'<CR>")
map("n", "<Up>", ":echo 'Use k'<CR>")
map("n", "<Down>", ":echo 'Use j'<CR>")
