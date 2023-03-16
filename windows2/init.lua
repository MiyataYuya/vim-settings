-- require "plugins"
require "config"

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local options = {
  encoding      = "utf-8",
  fileencodings = "utf-8",
  fileformats   = 'unix',
  termencoding  = "utf-8",
  expandtab     = true,
  tabstop       = 2,
  shiftwidth    = 2,
  softtabstop   = 2,
  autoindent    = true,
  smartindent   = true,
  number        = true,
  exrc          = true,
  showtabline   = 2,
  mouse         = "",
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

vim.cmd [[colorscheme desert]]






