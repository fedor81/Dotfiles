return {
  "lukas-reineke/virt-column.nvim",
  event = "BufRead",
  opts = {},
  config = function()
    require("virt-column").setup()
  end,
}
