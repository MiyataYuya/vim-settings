return {
  -- 自動ペア
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- コメント
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "行コメント切替" },
      { "gc", mode = { "n", "v" }, desc = "コメント切替" },
    },
    opts = {},
  },

  -- インデントガイド
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = { char = "│" },
      scope = { enabled = true },
    },
  },

  -- サラウンド
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  -- 検索数表示
  {
    "kevinhwang91/nvim-hlslens",
    event = "CmdlineEnter",
    opts = {},
  },

  -- TODO コメントハイライト
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "TODO一覧" },
    },
  },
}
