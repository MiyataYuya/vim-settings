return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- ナビゲーション
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, "次の変更")

        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, "前の変更")

        -- アクション
        map("n", "<leader>hs", gs.stage_hunk, "ステージ")
        map("n", "<leader>hr", gs.reset_hunk, "リセット")
        map("n", "<leader>hS", gs.stage_buffer, "全てステージ")
        map("n", "<leader>hu", gs.undo_stage_hunk, "ステージ取消")
        map("n", "<leader>hR", gs.reset_buffer, "バッファリセット")
        map("n", "<leader>hp", gs.preview_hunk, "プレビュー")
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame")
        map("n", "<leader>hd", gs.diffthis, "Diff")
      end,
    },
  },
}
