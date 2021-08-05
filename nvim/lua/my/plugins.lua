-- packer bootstrapping
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- packer packages
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --=== Core functionality ===--
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'junegunn/vim-easy-align'
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-entire'
  use 'michaeljsmith/vim-indent-object'
  use 'tommcdo/vim-exchange'
  use 'wellle/targets.vim'
  use 'chaoren/vim-wordmotion'
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section in 
        -- https://github.com/folke/which-key.nvim#%EF%B8%8F-configuration
      }
    end
  }

  --=== Editor ===--
  use '/usr/local/opt/fzf'
  use 'junegunn/fzf.vim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'scrooloose/nerdtree'
  use 'jpalardy/vim-slime'
  use 'vim-scripts/paredit.vim'
  use 'christoomey/vim-tmux-navigator'
  use 'wincent/terminus'
  use 'skywind3000/asyncrun.vim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  } 
  --=== Completion ===--
  use 'neovim/nvim-lspconfig'
  -- use 'honza/vim-snippets'
  -- use 'SirVer/ultisnips'
  -- use {'neoclide/coc.nvim', branch = 'release' }
  -- use 'dense-analysis/ale'
  
  --=== Filetype specific ===--
  use 'masukomi/vim-markdown-folding'
  use {
    'iamcco/markdown-preview.nvim', 
    run = 'cd app && yarn install', 
    cmd = 'MarkdownPreview'
  }
  use 'neovimhaskell/haskell-vim'
  use 'lervag/vimtex'
  use 'elmcast/elm-vim'
  
  --=== Visual ===--
  use 'luochen1990/rainbow'
  use 'airblade/vim-gitgutter'
  use 'gruvbox-community/gruvbox'
  use 'chriskempson/base16-vim'
  use 'junegunn/goyo.vim'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)
