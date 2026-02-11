return {
  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "tokyonight",
        globalstatus = true,
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  { "stevearc/dressing.nvim", event = "VeryLazy", opts = {} },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      vim.notify = require("notify")
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {},
  },
}

