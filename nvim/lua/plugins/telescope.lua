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

      -- rg / fd が PATH 上に無い環境では find_command を上書きせず既定(find等)にフォールバックする
      local find_files_opts = { hidden = true }
      if vim.fn.executable("rg") == 1 then
        -- ripgrep は .gitignore を既定で尊重するため node_modules 等が最初から候補に出ない
        find_files_opts.find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" }
      elseif vim.fn.executable("fd") == 1 or vim.fn.executable("fdfind") == 1 then
        -- fd も .gitignore を既定で尊重する。コマンド名はデフォルト検出に任せる
        find_files_opts.find_command = nil
      end

      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules/", "%.git/", "dist/", "build/" },
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
        pickers = {
          find_files = find_files_opts,
        },
      })
      pcall(telescope.load_extension, "fzf")
    end,
  },
}
