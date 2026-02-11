# 自分用nvim設定ファイル

lazy.nvimベースのNeovim設定。

## セットアップ

### 0. 準備

Git と Neovim をインストールする。

**Windows:**
```pwsh
winget install Git.Git
winget install Neovim.Neovim
```

**Linux (Ubuntu):**
```bash
sudo snap install nvim --classic
```

### 1. リポジトリをクローンする

```bash
git clone https://github.com/MiyataYuya/vim-settings.git
```

### 2. 設定ファイルをコピーする

**Windows:**
```pwsh
Copy-Item -Recurse vim-settings/nvim/* ~/AppData/Local/nvim/
```

**Linux / macOS:**
```bash
mkdir -p ~/.config/nvim
cp -r vim-settings/nvim/* ~/.config/nvim/
```

### 3. Neovimを起動する

```bash
nvim
```

初回起動時にlazy.nvimが自動でインストールされ、プラグインがセットアップされる。

## 構成

```
nvim/
├── init.lua              -- エントリポイント
├── lazy-lock.json        -- プラグインバージョンのロックファイル
└── lua/
    ├── config/
    │   ├── lazy.lua      -- lazy.nvimのブートストラップと設定
    │   ├── options.lua   -- Neovimオプション
    │   └── keymaps.lua   -- キーマッピング
    └── plugins/
        ├── init.lua      -- その他プラグイン
        ├── colorscheme.lua
        ├── completion.lua
        ├── copilot.lua
        ├── editor.lua
        ├── explorer.lua
        ├── git.lua
        ├── lsp.lua
        ├── telescope.lua
        ├── treesitter.lua
        └── ui.lua
```
