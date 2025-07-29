-- This file was created based on Zeioth/compiler.nvim
-- https://github.com/Zeioth/compiler.nvim/blob/main/lua/compiler/utils.lua

local M = {}

---Function that returns true if a file exists in physical storage
---@return boolean|nil exists true or false
function M.file_exists(filename)
  local stat = vim.loop.fs_stat(filename)
  return stat and stat.type == "file"
end

---Function that returns the path of the .nvim_code_runner file if exists in the current
---working diectory root, or nil otherwise.
---@return string|nil path Path of the .nvim_code_runner file if exists in the current
---working diectory root, or nil otherwise.
function M.get_config_file()
  if M.file_exists ".nvim_code_runner.sh" then
    return vim.fn.getcwd() .. "/.nvim_code_runner.sh"
  else
    return nil
  end
end

function M.read_file(file_path)
  local file = io.open(file_path, "r")
  if not file then
    error("The file could not be opened: " .. file_path)
  end
  local content = file:read "*all"
  file:close()
  return string.gsub(content, "\n$", "") -- Remove the trailing newline character, if it exists
end

return M
