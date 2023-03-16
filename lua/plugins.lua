-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/vim-vsnip'

  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use 'easymotion/vim-easymotion'
  use 'michaeljsmith/vim-indent-object'
  use { 'cohama/lexima.vim',
        config = function()
          -- pair = luaeval("{'char'= '<', 'input_after'= '>'}")
          vim.fn["lexima#add_rule"]({char = '<', input_after = '>'})
        end
      }
  -- call lexima#add_rule({'char': '<', 'input_after': '>'})

  use { 'thaerkh/vim-workspace',
        config = function()
          -- vim.g.workspace_autocreate = 1
          vim.keymap.set('n', "<leader>s", ":ToggleWorkspace<CR>")
        end
      }

  use { 'vim-airline/vim-airline',
        config = function()
          vim.g[ "airline#extensions#tabline#enabled" ] = 1
          vim.keymap.set('n', "<C-p>", "<Plug>AirlineSelectPrevTab",{silent = true})
          vim.keymap.set('n', "<C-n>", "<Plug>AirlineSelectNextTab",{silent = true})
        end
      }
  use 'vim-airline/vim-airline-themes'
  use 'tomasiser/vim-code-dark'
  use 'kuroitu/pyceberg'
  use 'vim-python/python-syntax'
end)
