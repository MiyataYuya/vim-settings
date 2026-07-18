-- nvim-treesitter は 2026-04-03 に archive・凍結された。
-- 方針B: パーサー導入は ts-install に委譲し、ハイライト/インデントは native 0.12 API で行う。
--   - nvim-treesitter(main) … 非同梱言語のクエリ(.scm)供給源としてのみ残す。旧ランタイムは無効化。
--   - ts-install.nvim       … パーサーの導入/更新。コマンドは :TS install/update/uninstall/log。
--     setup() が ensure_install を自動で非同期インストールするので明示コマンドは基本不要。
--     コンパイルには C コンパイラ + tree-sitter CLI が必要(このマシンでは zig を使用)。
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    init = function()
      -- 旧モジュール群(archive済み)を読み込ませず、クエリ資産だけ使う。
      vim.g.loaded_nvim_treesitter = 1
    end,
  },

  {
    "lewis6991/ts-install.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_install = {
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "go",
        "bash",
      },
    },
    config = function(_, opts)
      require("ts-install").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          -- notify/noice 等プラグインの内部UIバッファ(buftype が nofile/prompt 等)は対象外。
          if vim.bo[ev.buf].buftype ~= "" then
            return
          end

          -- パーサーが無いファイルタイプでは start が E5108 で落ちるため pcall で守る。
          if not pcall(vim.treesitter.start, ev.buf) then
            return
          end

          -- treesitter ベースのインデント(experimental)。クエリは nvim-treesitter(main) 由来。
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
