return { -- Подстветка синтаксиса
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "html",
      "css",
      "python",
      "javascript",
      "cpp",
      "rust",
      "toml",
      "bash",
      "json",
      "hyprlang",
      "markdown",
      "c_sharp",
    },
  },
}
