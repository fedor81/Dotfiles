return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- Подстветка синтаксиса
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "pyright",
        "mypy",
        "ruff",
        "black",
        "debugpy",
        "emmet-language-server",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  },
  -- Debbuger
  {
    "mfussenegger/nvim-dap",
  },
  -- Tests
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local path = "python"
      require("dap-python").setup(path)
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  -- html и css генератор
  {
    "olrtg/nvim-emmet",
    config = function() end,
  },
  -- Оборачивает содержимое
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "dense-analysis/ale",
    config = function()
      local g = vim.g
      g.ale_linters = {
        python = { "mypy" },
        lua = { "lua_language_server" },
      }
      g.ale_fixers = {
        ["*"] = { "prettier" },
        python = { "black" },
        lua = { "stylua" },
      }
      g.ale_fix_on_save = 1
    end,
  },
  -- Автозакрытие тегов
  {
    "windwp/nvim-ts-autotag",
    event = "BufRead",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    ft = { "html", "xml" },
  },
  -- Подсказки при написании функции
  {
    "folke/neodev.nvim",
    opts = {},
  },
  -- Быстрое перемещение
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function()
      local leap = require "leap"
      leap.add_default_mappings(true)
    end,
  },
  -- Quickfix
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },
  -- Нейросеть
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },
  -- GitHub Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
    },
  },
}
-- Dashboard если вдруг понадобится
-- {
--   'nvimdev/dashboard-nvim',
--   event = 'VimEnter',
--   config = function()
--     require('dashboard').setup {
--       -- config
--     }
--   end,
--   dependencies = { {'nvim-tree/nvim-web-devicons'}}
-- },
-- GitHub Copilot только нужно перебиндить tab
-- {
--   "github/copilot.vim",
--   lazy = false,
--   config = function() -- Mapping tab is already used by NvChad
--     vim.g.copilot_no_tab_map = true
--     vim.g.copilot_assume_mapped = true
--     vim.g.copilot_tab_fallback = ""
--     -- The mapping is set to other key, see custom/lua/mappings
--     -- or run <leader>ch to see copilot mapping section
--   end,
-- },
