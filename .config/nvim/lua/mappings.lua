require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<leader>n", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("i", "jj", "<ESC>")
map("n", "<leader>cx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close All Buffers" })
map("i", "zz", "<ESC>zza", { desc = "Center this line", silent = true })

-- Убрать создание терминала из NvChad
vim.keymap.del("n", "<leader>h")
vim.keymap.del("n", "<leader>v")

-- Удаление x не трогает буфер обмена
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true })

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
end, { desc = "Debug Continue" })
map("n", "<leader>dC", function()
  require("dap").run_to_cursor()
end, { desc = "Run to Cursor" })
map("n", "<leader>dn", function()
  require("dap").step_over()
end, { desc = "Step Over" })
map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "Toggle Dap UI" })
map("n", "<leader>dw", function()
  require("dap.ui.widgets").hover()
end, { desc = "Dap UI Widgets" })
map("n", "<leader>dt", function()
  require("dap").terminate()
end, { desc = "Debug Terminate" })
map("n", "<leader>dr", function()
  require("dap").repl.toggle()
end, { desc = "Toggle REPL" })
map("n", "<leader>de", function()
  require("dapui").eval()
end, { desc = "Dap UI Eval" })

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

-- UFO - folding
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
map("n", "zR", require("ufo").openAllFolds, { desc = "UFO open all folds" })
map("n", "zM", require("ufo").closeAllFolds, { desc = "UFO close all folds" })

-- Rename
map("n", "<leader>rn", ":IncRename ", { desc = "Rename word on cursor" })

-- Hardtime
map("n", "<leader>ht", "<cmd>Hardtime toggle<CR>", { desc = "Toggle Hardtime" })

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
map("n", "<leader>fs", "<cmd>SessionSearch<CR>", { desc = "Session search" })

-- Find and Replace
map("n", "<leader>sr", function()
  require("grug-far").grug_far { prefills = { search = vim.fn.expand "<cword>" } }
end, { desc = "GrugFar - Find Under Cursor", silent = true })

-- Git
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
map("n", "<leader>ng", function()
  require("neogit").open()
end, { desc = "Open NeoGit" })

map("n", "<Leader>gd", "<cmd>DiffviewFileHistory %<CR>", { desc = "Diffview File History" })
map("n", "<Leader>gv", "<cmd>DiffviewOpen<CR>", { desc = "Diffview Open" })

-- Rust
map("n", "<leader>rur", function()
  vim.cmd.RustLsp "runnables"
end, { desc = "RustLsp runnanles" })

-- Важная настройка
-- map("n", "<Left>", ":echo 'Use h'<CR>")
-- map("n", "<Right>", ":echo 'Use l'<CR>")
-- map("n", "<Up>", ":echo 'Use k'<CR>")
-- map("n", "<Down>", ":echo 'Use j'<CR>")
