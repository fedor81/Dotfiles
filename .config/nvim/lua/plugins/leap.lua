return { -- Быстрое перемещение
  "ggandor/leap.nvim",
  enabled = false,
  keys = {
    { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
    { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
    { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
  },
  config = function()
    local leap = require "leap"
    leap.add_default_mappings(true)
  end,
}
