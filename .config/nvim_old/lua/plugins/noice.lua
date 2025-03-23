return { -- UI for messages, cmdline and the popupmenu.
  "folke/noice.nvim",
  enabled = false, -- Надо настраивать, поэтому выключил
  event = "VeryLazy",
  opts = {
    cmdline = { view = "cmdline" },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
