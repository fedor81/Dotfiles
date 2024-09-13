return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      htmldjango = { "djlint" },
      python = { "black" },
      cpp = { "clang-format" },
      sh = { "beautysh" },
      rust = { "rustfmt" },
      cs = { "csharpier" },
      markdown = { "prettier" },
    },

    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
    format_after_save = {
      lsp_format = "fallback",
    },
  },
}
