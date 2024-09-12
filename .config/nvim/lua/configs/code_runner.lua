local m = {}

m.id = "runner"
m.pos = "float"

function m.run_code()
  local file_type = vim.bo.ft

  if file_type == "rust" then
    vim.cmd.RustLsp "runnables"
  else
    require("nvchad.term").runner {
      id = m.id,
      pos = m.pos,

      cmd = function()
        local file = vim.fn.expand "%"

        local ft_cmds = {
          python = "python3 " .. file,
          cpp = "clear && g++ -o out " .. file .. " && ./out",
          cs = "dotnet run",
          rust = "cargo run",
        }

        return ft_cmds[file_type]
      end,
    }
  end
end

return m
