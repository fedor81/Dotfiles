return { -- Автозакрытие html тегов
  "windwp/nvim-ts-autotag",
  event = "BufRead",
  config = function()
    require("nvim-ts-autotag").setup()
  end,
  ft = { "html", "xml" },
}
