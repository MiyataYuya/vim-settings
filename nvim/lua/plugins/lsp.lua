return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>cm", "<cmd>Mason<CR>", desc = "Mason" },
    },
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "pyright",
        "jsonls",
        "html",
        "cssls",
      },
      automatic_installation = true,
    },
  },

  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSPキーマップ（バッファローカル）
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          map("n", "gd", vim.lsp.buf.definition, "定義へ移動")
          map("n", "gD", vim.lsp.buf.declaration, "宣言へ移動")
          map("n", "gr", vim.lsp.buf.references, "参照一覧")
          map("n", "gi", vim.lsp.buf.implementation, "実装へ移動")
          map("n", "K", vim.lsp.buf.hover, "ホバー情報")
          map("n", "<leader>ca", vim.lsp.buf.code_action, "コードアクション")
          map("n", "<leader>cr", vim.lsp.buf.rename, "リネーム")
          map("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "フォーマット")
          map("n", "<leader>cs", vim.lsp.buf.signature_help, "シグネチャヘルプ")
          map("i", "<C-s>", vim.lsp.buf.signature_help, "シグネチャヘルプ")
        end,
      })

      -- サーバー設定
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
        ts_ls = {},
        pyright = {},
        jsonls = {},
        html = {},
        cssls = {},
      }

      -- Nvim 0.11+ の推奨方法
      for server, config in pairs(servers) do
        config.capabilities = capabilities
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  },
}
