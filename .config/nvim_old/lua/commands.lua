vim.cmd 'command! Chat lua require("CopilotChat").open()'
vim.cmd 'command! ChatReset lua require("CopilotChat").reset(); require("CopilotChat").open()'
