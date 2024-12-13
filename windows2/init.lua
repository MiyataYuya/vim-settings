-- require "plugins"
vim.g.python3_host_prog = [[C:\Python311\python.EXE]]
require "plugins"
require "config"

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local options = {
  ambiwidth     = "single",
  autoindent    = true,
  encoding      = "utf-8",
  expandtab     = true,
  exrc          = true,
  fileencodings = "utf-8",
  fileformats   = 'unix',
  -- mouse         = "",
  number        = true,
  shiftwidth    = 2,
  showtabline   = 2,
  smartindent   = true,
  softtabstop   = 2,
  tabstop       = 2,
--  termencoding  = "utf-8",
-- scriptencoding utf-8,
-- autochdir,
-- shell=pwsh,
-- shell=C:\Program\ Files\Git\bin\bash.exe,
-- shellcmdflag=-c,
-- shellquote=",
-- shellslash,
-- termguicolors,
}
for k,v in pairs(options) do
  vim.opt[k] = v
end

vim.g.mapleader = " "

vim.scriptencoding = "utf-8"
vim.termencoding = "utf-8"

if not vim.g.vscode then
  vim.cmd [[colorscheme desert]]
else
  vim.keymap.set('n', ":e", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>", {silent = true})
end

