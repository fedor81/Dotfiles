-- This file  needs to have same structure as nvconfig.lua

local M = {}

M.base46 = {
  theme = "palenight",
  theme_toggle = { "material-lighter", "palenight" },
  transparency = true,
}

M.ui = {
  nvdash = {
    load_on_startup = true,
  },
}

M.mason = {
  pkgs = require("configs.mason_nvim").ensure_installed,
}

M.term = {
  pos = "float",
  float = {
    width = 1.0,
    height = 0.8,
  },
}

return M
