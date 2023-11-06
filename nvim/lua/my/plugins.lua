-- lazyvim bootstrapping
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



-- lazy packages

require("lazy").setup({
	-- === Core functionality ===--
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"junegunn/vim-easy-align",
  { "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } },
	"michaeljsmith/vim-indent-object",
	"tommcdo/vim-exchange",
	"wellle/targets.vim",
	"chaoren/vim-wordmotion",
	"folke/which-key.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
  { 'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate' },

	-- === Editor ===--
	{ "junegunn/fzf", dir = "~/.fzf", build = "./install --all" },
	"junegunn/fzf.vim",
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-telescope/telescope-z.nvim",
  "ryanoasis/vim-devicons",
	"scrooloose/nerdtree",
	"jpalardy/vim-slime",
	"vim-scripts/paredit.vim",
	"christoomey/vim-tmux-navigator",
	"wincent/terminus",
	"skywind3000/asyncrun.vim",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	{ "kyazdani42/nvim-tree.lua", dependencies = { "kyazdani42/nvim-web-devicons" } },

	-- === Completion ===--
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "onsails/lspkind-nvim",
	"andersevenrud/compe-tmux",
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
  "simrat39/rust-tools.nvim",
  "rafamadriz/friendly-snippets",
	"jose-elias-alvarez/null-ls.nvim",
	"folke/trouble.nvim",

	-- === Filetype specific ===--,
	"masukomi/vim-markdown-folding",
	"neovimhaskell/haskell-vim",
	"lervag/vimtex",
	"elmcast/elm-vim",
	"pangloss/vim-javascript",
  "mustache/vim-mustache-handlebars",

	-- === Visual ===--,
	"luochen1990/rainbow",
	"airblade/vim-gitgutter",
	"gruvbox-community/gruvbox",
	"chriskempson/base16-vim",
	"junegunn/goyo.vim",
	{ "hoob3rt/lualine.nvim", dependencies = { { "kyazdani42/nvim-web-devicons", lazy = true } } },
	"nvim-lua/lsp-status.nvim",
	"folke/lsp-colors.nvim",
  "RRethy/vim-illuminate"
}
)
