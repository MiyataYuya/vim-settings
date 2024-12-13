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

  use { 'vim-airline/vim-airline',
        config = function()
          vim.g[ "airline#extensions#tabline#enabled" ] = 1
          vim.keymap.set('n', "<C-p>", "<Plug>AirlineSelectPrevTab",{silent = true})
          vim.keymap.set('n', "<C-n>", "<Plug>AirlineSelectNextTab",{silent = true})
        end
      }
  use 'vim-airline/vim-airline-themes'
  use 'tomasiser/vim-code-dark'

  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use 'easymotion/vim-easymotion'
  use 'michaeljsmith/vim-indent-object'
  use 'cohama/lexima.vim'
  use {'nathanaelkane/vim-indent-guides'}
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
  --  lsp
  use 'github/copilot.vim'
end)
