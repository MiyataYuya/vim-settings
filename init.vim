" lua require('config')

let mapleader = "\<Space>"

set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,cp932,sjis,utf-16le
set fileformats=unix,dos

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set number

set mouse=

set showtabline=2
" set autochdir

" set shell=pwsh
" set shell=C:\Program\ Files\Git\bin\bash.exe
" set shellcmdflag=-c
" set shellquote="
" set shellslash

"  set termguicolors
set exrc

" if exists('g:vscode')
"   " autocmd FileType python nnoremap <F5> <Cmd>Call VSCodeNotify('workbech.python.execInTerminal')<CR>
"   nnoremap <F5> <Cmd>Call VSCodeNotify('workbech.python.execInTerminal')<CR>
" endif

" カラースキーム
colorscheme desert


let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE . '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim


" Required:
if dein#load_state($HOME . '/.cache/dein')

  " XDG base direcory compartible
  let g:dein#cache_directory = $HOME . '/.cache/dein'

  " dein begin
  call dein#begin($HOME . '/.cache/dein')

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let s:toml_dir  = $HOME . '/.config/nvim'
  if exists('g:vscode')
    let s:toml      = s:toml_dir . '/dein_vscode.toml'
    let s:lazy_toml = s:toml_dir . '/dein_vscode_lazy.toml'
    nnoremap <silent> :e <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
  else
    let s:toml      = s:toml_dir . '/dein.toml'
    let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
  endif

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif


filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" End dein Scripts-------------------------
