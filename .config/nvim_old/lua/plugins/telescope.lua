return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "jvgrootveld/telescope-zoxide",
    opts = {
      extensions_list = { "fzf", "zoxide" },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        zoxide = {
          prompt_title = "[ Walking on the shoulders of TJ ]",
        },
      },
    },
  },
  {
    "jvgrootveld/telescope-zoxide",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}
