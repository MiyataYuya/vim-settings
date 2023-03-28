-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  -- if not vim.g.vscode then
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/vim-vsnip'
  use { 'thaerkh/vim-workspace',
        config = function()
          vim.keymap.set('n', "<leader>s", ":ToggleWorkspace<CR>")
          vim.g.workspace_create_new_tabs = 0
          vim.g.workspace_persist_undo_history = 0
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
  -- use 'Mofiqul/vscode.nvim'
  -- use 'kuroitu/pyceberg'
  -- use { 'vim-python/python-syntax',
  --       config = function()
  --         vim.g.python_highlight_all = 1
  --       end
  --     }
  -- end

  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use 'easymotion/vim-easymotion'
  use 'michaeljsmith/vim-indent-object'
  use { 'cohama/lexima.vim',
        config = function()
          vim.fn["lexima#add_rule"]({char = '<', input_after = '>'})
        end
      }
  use {'nathanaelkane/vim-indent-guides'}
  use 'nvim-treesitter/nvim-treesitter'
  use {'m-demare/hlargs.nvim',
        config = function()
      	  require("config.hlargs").setup()
        end}
  -- use {'nathanaelkane/vim-indent-guides',
  --       config = function()
  --         vim.g.indent_guides_enable_on_vim_startup = 1
  --       end}
  -- use {'adi/vim-indent-rainbow'}
  -- use { 'tell-k/vim-autopep8',
  -- config = function()
  --             vim.cmd([[
  --             function! Preserve(command)
  --               let search = @/
  --               let cursor_position = getpos('.')
  --               normal! H
  --               let window_position = getpos('.')
  --               call setpos('.', cursor_position)
  --               execute a:command
  --               let @/ = search
  --               call setpos('.', window_position)
  --               normal! zt
  --               call setpos('.', cursor_position)
  --             endfunction
  --             ]])

  --             vim.cmd([[
  --             function! Autopep8()
  --                 call Preserve(':silent %!autopep8 --ignore=E501 -')
  --             endfunction
  --             ]], true)

  --             vim.cmd('autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>')
  --          end
  --  }
end)
