let mapleader = "\<Space>"

set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8
" set fileformats=unix,dos
set termencoding=utf-8

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set number

set exrc

set showtabline=2
" set autochdir

" set shell=pwsh
" set shell=C:\Program\ Files\Git\bin\bash.exe
" set shellcmdflag=-c
" set shellquote="
" set shellslash

"  set termguicolors

set mouse=

let $CACHE = expand('~/AppData/Local/nvim')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $HOME . '/AppData/Local/nvim/dein/repos/github.com/Shougo/dein.vim'
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
set runtimepath+=$HOME/AppData/Local/nvim/dein/repos/github.com/Shougo/dein.vim


" Required:
if dein#load_state($HOME . '/AppData/Local/nvim/dein')

  " XDG base direcory compartible
  let g:dein#cache_directory = $HOME . '/.cache/dein'

  " dein begin
  call dein#begin($HOME . '/AppData/Local/nvim/dein')

  " プラグインリストを収めた TOML ファイル
  let s:toml_dir  = $HOME . '/AppData/Local/nvim/dein/toml'
  if exists('g:vscode')
    nnoremap <silent> :e <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
    let s:toml      = s:toml_dir . '/dein_vscode.toml'
    let s:lazy_toml = s:toml_dir . '/dein_vscode_lazy.toml'
  else
    let s:toml      = s:toml_dir . '/lsp.toml'
    let s:lazy_toml = s:toml_dir . '/lsp_lazy.toml'

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
"End dein Scripts-------------------------

if !exists('g:vscode')

  " lua require('config')
  
  " lexima
  " call lexima#add_rule({'char': '<', 'input_after': '>'})

else
  " ddc.vim
  call ddc#custom#patch_global('ui', 'native')
  call ddc#custom#patch_global('sources', ['around'])
  call ddc#custom#patch_global('sources', ['vim-lsp'])
  call ddc#custom#patch_global('sourceOptions', #{
        \ _: #{
        \   matchers: ['matcher_head'],
        \   sorters: ['sorter_rank']},
        \   minAutoCompletionLength: 0,
        \ })
  call ddc#custom#patch_global('sourceOptions', #{
        \   around: #{ mark: 'A' },
        \ })

  call ddc#enable()

  " vim-lsp
  if executable('pylsp')
      " pip install python-lsp-server
      au User lsp_setup call lsp#register_server({
          \ 'name': 'pylsp',
          \ 'cmd': {server_info->['pylsp']},
          \ 'allowlist': ['python'],
          \ })
  endif

  function! s:on_lsp_buffer_enabled() abort
      setlocal omnifunc=lsp#complete
      setlocal signcolumn=yes
      if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
      nmap <buffer> gd <plug>(lsp-definition)
      nmap <buffer> gs <plug>(lsp-document-symbol-search)
      nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
      nmap <buffer> gr <plug>(lsp-references)
      nmap <buffer> gi <plug>(lsp-implementation)
      nmap <buffer> gt <plug>(lsp-type-definition)
      nmap <buffer> <leader>rn <plug>(lsp-rename)
      nmap <buffer> [g <plug>(lsp-previous-diagnostic)
      nmap <buffer> ]g <plug>(lsp-next-diagnostic)
      nmap <buffer> K <plug>(lsp-hover)
      " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
      " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

      let g:lsp_format_sync_timeout = 1000
      autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
      
      " refer to doc to add more commands
  endfunction

  augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
  augroup END
endif

colorscheme desert
" set t_Co=256
" set t_ut=
" colorscheme codedark
" colorscheme pyceberg


