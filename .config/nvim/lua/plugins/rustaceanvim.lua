return {
  "mrcjkb/rustaceanvim",
  ft = { "rust" },
  version = "^4", -- Recommended
  lazy = false, -- This plugin is already lazy
  config = function()
    require "configs.rustaceanvim"
  end,
}
