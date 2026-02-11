-- キーマップ設定
local map = vim.keymap.set

-- 検索ハイライト解除
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- バッファ操作
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "前のバッファ" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "次のバッファ" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "バッファを閉じる" })

-- ウィンドウ操作
map("n", "<C-h>", "<C-w>h", { desc = "左のウィンドウ" })
map("n", "<C-j>", "<C-w>j", { desc = "下のウィンドウ" })
map("n", "<C-k>", "<C-w>k", { desc = "上のウィンドウ" })
map("n", "<C-l>", "<C-w>l", { desc = "右のウィンドウ" })

-- ウィンドウサイズ調整
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "高さを増やす" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "高さを減らす" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "幅を減らす" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "幅を増やす" })

-- 行移動（ビジュアルモード）
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "行を下に移動" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "行を上に移動" })

-- インデント維持
map("v", "<", "<gv")
map("v", ">", ">gv")

-- 中央維持
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- ファイル保存
map("n", "<leader>w", "<cmd>w<CR>", { desc = "保存" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "終了" })

-- 診断（Diagnostics）
map("n", "[d", vim.diagnostic.goto_prev, { desc = "前の診断" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "次の診断" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "診断を表示" })

-- ターミナルモードでのウィンドウ移動
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "左のウィンドウへ" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "下のウィンドウへ" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "上のウィンドウへ" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "右のウィンドウへ" })
