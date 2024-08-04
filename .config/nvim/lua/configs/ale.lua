local g = vim.g
g.ale_linters = {
  python = { "mypy" },
  lua = { "lua_language_server" },
  cpp = { "clangd", "cppcheck", "cpplint", "clangtidy" },
}
-- Для форматировния используется conform
-- g.ale_fixers = {
--   ["*"] = { "prettier" },
--   python = { "black" },
-- }
-- g.ale_fix_on_save = 1
