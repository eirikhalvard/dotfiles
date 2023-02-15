-- packer bootstrapping
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
end

-- packer packages
return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- === Core functionality ===--
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("junegunn/vim-easy-align")
	use("kana/vim-textobj-user")
	use("kana/vim-textobj-entire")
	use("michaeljsmith/vim-indent-object")
	use("tommcdo/vim-exchange")
	use("wellle/targets.vim")
	use("chaoren/vim-wordmotion")
	use("folke/which-key.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

	-- === Editor ===--
	use({ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" })
	use("junegunn/fzf.vim")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-z.nvim")
  use("ryanoasis/vim-devicons")
	use("scrooloose/nerdtree")
	use("jpalardy/vim-slime")
	use("vim-scripts/paredit.vim")
	use("christoomey/vim-tmux-navigator")
	use("wincent/terminus")
	use("skywind3000/asyncrun.vim")
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

	-- === Completion ===--
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lsp-signature-help")
  use("onsails/lspkind-nvim")
	use("andersevenrud/compe-tmux")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
  use("simrat39/rust-tools.nvim")
  use("rafamadriz/friendly-snippets")
	use("jose-elias-alvarez/null-ls.nvim")
	use("folke/trouble.nvim")

	-- === Filetype specific ===--
	use("masukomi/vim-markdown-folding")
	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" })
	use("neovimhaskell/haskell-vim")
	use("lervag/vimtex")
	use("elmcast/elm-vim")
	use("pangloss/vim-javascript")
  use("mustache/vim-mustache-handlebars")

	-- === Visual ===--
	use("luochen1990/rainbow")
	use("airblade/vim-gitgutter")
	use("gruvbox-community/gruvbox")
	use("chriskempson/base16-vim")
	use("junegunn/goyo.vim")
	use({ "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
	use("nvim-lua/lsp-status.nvim")
	use("folke/lsp-colors.nvim")
  use("RRethy/vim-illuminate")
end)
