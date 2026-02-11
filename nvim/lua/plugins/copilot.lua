return {
  {
    "github/copilot.vim",
    lazy = true,
    event = "InsertEnter", -- 挿入モードで読み込む
  },

  {
    "coder/claudecode.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "ClaudeCode" }, -- コマンド実行時にロード
    opts = {
      auto_start = true,
    },
  },
}

