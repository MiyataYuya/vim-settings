return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "ファイル検索" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "文字列検索" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "バッファ一覧" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "ヘルプ検索" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "最近のファイル" },
      { "<leader>fc", "<cmd>Telescope commands<CR>", desc = "コマンド一覧" },
      { "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "診断一覧" },
      { "<leader><leader>", "<cmd>Telescope buffers<CR>", desc = "バッファ切替" },
      { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "バッファ内検索" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
      })
      pcall(telescope.load_extension, "fzf")
    end,
  },
}
