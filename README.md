# 自分用nvim設定ファイル

## windowsの場合

0. 準備

   * Gitをインストールする。
   ```pwsh
    winget install Git.Git 
   ```
    * neovimをインストールする。
    ```pwsh
     winget install nvim
    ```

1. リポジトリをクローンする。

    ```pwsh
    git clone https://github.com/MiyataYuya/vim-settings.git
    ```

2. ディレクトリを作成

    ```pwsh
    mkdir ~/AppData/Local/nvim
    ```

3. リポジトリの`windows2`の一部をコピーする

   ```pwsh
   cp init.lua ~/AppData/Local/nvim/init.lua
   cp lua ~/AppData/Local/nvim/
   cp plugin ~/AppData/Local/nvim/
   ```

4. nvimのパッケージマネージャー、packerをインストールする。

   ```pwsh
   git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
   ```

5. nvimを起動し、`:PackerUpdate`を実行する。

6. nvimを再起動すると設定が適用されているはず。

## linux(wsl)の場合

0. 準備
   
   * wslをインストールする。

   ```pwsh
   wsl --install
   ``` 
   
   * ディストリビューション(ここではUbuntu24.04)をインストールする。

   ```pwsh
   wsl --install Ubuntu-24.04 -n
   ```
   
   * PCを再起動する。
   * aptをアップデートする。

   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

1. nvimをインストールする。

   ```bash
   sudo snap install nvim --classic
   ```
   
   ※ここまできてvscodeでnvimが使える。

2. リポジトリをクローンする。

   ```bash
   git clone https://github.com/MiyataYuya/vim-settings.git
   ```

3. ディレクトリを作成

   ```bash
   mkdir .config
   mkdir .config/nvim
   ```

4. リポジトリの`linux`の一部をコピーする

   ```bash
   cp init.lua ~/.config/nvim/
   mkdir ~/.config/nvim/lua
   cp lua/config.lua ~/.config/nvim/lua/
   cp lua/plugins.lua ~/.config/nvim/lua/
   ```

5. nvimのパッケージマネージャー、packerをインストールする。

   ```bash
   git clone --depth 1 https://github.com/wbthomason/packer.nvim\ 
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```

6. nvimを起動し、`:PackerUpdate`を実行する。
7. nvimを再起動すると設定が適用されているはず。

