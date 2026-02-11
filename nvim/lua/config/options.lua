-- 基本オプション設定
local opt = vim.opt

-- 行番号
opt.number = true
opt.relativenumber = true

-- タブ・インデント
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- 検索
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- 表示
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false

-- 分割
opt.splitbelow = true
opt.splitright = true

-- その他
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.swapfile = false
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = "menu,menuone,noselect"

-- 不可視文字
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
