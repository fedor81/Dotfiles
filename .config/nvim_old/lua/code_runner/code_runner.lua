local m = {}

m.id = "runner"
m.pos = "float"

local utils = require "code_runner.utils"

---@param cmd string command to execute
local function run_term(cmd)
  require("nvchad.term").runner {
    id = m.id,
    pos = m.pos,
    cmd = cmd,
  }
end

function m.run_code_by_default()
  local file_type = vim.bo.ft

  if file_type == "rust" then
    vim.cmd.RustLsp "runnables"
  else
    local file = vim.fn.expand "%"
    local ft_cmds = {
      python = "python3 " .. file,
      cs = "dotnet run",
      rust = "cargo run",
    }
    run_term(ft_cmds[file_type])
  end
end

function m.run_code()
  local file_path = utils.get_config_file()
  if file_path ~= nil then
    local content = utils.read_file(file_path)
    run_term(content)
  else
    m.run_code_by_default()
  end
end

return m
