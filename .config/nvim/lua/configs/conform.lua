local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    htmldjango = { "djlint" },
    python = { "black" },
    cpp = { "clang-format" },
    sh = { "beautysh" }, -- Не работает
    rust = { "rustfmt" },
  },

  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
  format_after_save = {
    lsp_format = "fallback",
  },
}

require("conform").setup(options)
