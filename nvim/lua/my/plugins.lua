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
	-- === Editor ===--

	{
	  "hrsh7th/nvim-cmp",
	  dependencies = {
	    "hrsh7th/cmp-nvim-lsp",
	    "hrsh7th/cmp-nvim-lua",
	    "hrsh7th/cmp-buffer",
	    "hrsh7th/cmp-path",
	    "hrsh7th/cmp-nvim-lsp-signature-help",
	    "L3MON4D3/LuaSnip",
	    "saadparwaiz1/cmp_luasnip",
	    "onsails/lspkind-nvim",
	  },
	  config = function()
	    local cmp = require("cmp")
	    local luasnip = require("luasnip")
	    local lspkind = require("lspkind")

	    lspkind.init({ mode = "symbol_text", preset = "default" })
	    require("luasnip.loaders.from_vscode").lazy_load()

	    local has_words_before = function()
	      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	    end

	    cmp.setup({
	      snippet = {
	        expand = function(args)
	          luasnip.lsp_expand(args.body)
	        end,
	      },
	      completion = { completeopt = "menu,menuone,noinsert,noselect" },
	      mapping = {
	        ["<C-p>"] = cmp.mapping.select_prev_item(),
	        ["<C-n>"] = cmp.mapping.select_next_item(),
	        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
	        ["<C-f>"] = cmp.mapping.scroll_docs(4),
	        ["<C-Space>"] = cmp.mapping.complete(),
	        ["<C-e>"] = cmp.mapping.close(),
	        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
	        ["<Tab>"] = cmp.mapping(function(fallback)
	          if luasnip.expand_or_jumpable() then
	            luasnip.expand_or_jump()
	          elseif has_words_before() then
	            cmp.complete()
	          else
	            fallback()
	          end
	        end, { "i", "s" }),
	        ["<S-Tab>"] = cmp.mapping(function(fallback)
	          if luasnip.jumpable(-1) then
	            luasnip.jump(-1)
	          else
	            fallback()
	          end
	        end, { "i", "s" }),
	      },
	      formatting = {
	        format = lspkind.cmp_format({
	          mode = "symbol_text",
	          maxwidth = 50,
	          symbol_map = {
	            Text = "", Method = "", Function = "", Constructor = "",
	            Field = "ﰠ", Variable = "", Class = "ﴯ", Interface = "",
	            Module = "", Property = "ﰠ", Unit = "塞", Value = "",
	            Enum = "", Keyword = "", Snippet = "", Color = "",
	            File = "", Reference = "", Folder = "", EnumMember = "",
	            Constant = "", Struct = "פּ", Event = "", Operator = "",
	          },
	        }),
	      },
	      sources = {
	        { name = "nvim_lsp" },
	        { name = "nvim_lsp_signature_help" },
	        { name = "nvim_lua" },
	        { name = "luasnip" },
	        { name = "path" },
	        { name = "buffer" },
	      },
	    })
	  end,
	},

	-- LSP
	{
	  "neovim/nvim-lspconfig",
	  config = function()
	    local lsp = vim.lsp

	    -- Haskell
	    lsp.config("hls", {
	      cmd = { "haskell-language-server-wrapper", "--lsp" },
	      filetypes = { "haskell", "lhaskell" },
	      root_markers = {
	        "cabal.project",
	        "stack.yaml",
	        "package.yaml",
	        "*.cabal",
	      },
	      settings = {
	        haskell = {
	          formattingProvider = "fourmolu",
	        },
	      },
	    })

	    -- TypeScript
	    lsp.config("tsserver", {
	      cmd = { "typescript-language-server", "--stdio" },
	      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	      root_markers = { "package.json", "tsconfig.json", ".git" },
	    })

	    -- Python
	    lsp.config("pylsp", {
	      cmd = { "pylsp" },
	      filetypes = { "python" },
	      root_markers = { "pyproject.toml", "setup.py", ".git" },
	    })

	    -- JSON
	    lsp.config("jsonls", {
	      cmd = { "vscode-json-language-server", "--stdio" },
	      filetypes = { "json", "jsonc" },
	    })

	    -- Bash
	    lsp.config("bashls", {
	      cmd = { "bash-language-server", "start" },
	      filetypes = { "sh", "bash" },
	    })

	    -- Auto-start LSPs
	    vim.api.nvim_create_autocmd("FileType", {
	      callback = function()
	        lsp.start({
	          name = vim.bo.filetype,
	        })
	      end,
	    })
	  end,
	},

	-- Treesitter
	{
	  "nvim-treesitter/nvim-treesitter",
	  build = ":TSUpdate",
	  event = { "BufReadPost", "BufNewFile" },
	  config = function()
	    require("nvim-treesitter.configs").setup({
	      ensure_installed = {
	        "haskell", "elm", "lua", "python", "r", "scala",
	        "json", "markdown", "dockerfile", "yaml",
	        "bash", "vim", "css", "html",
	      },
	      highlight = {
	        enable = true,
	        additional_vim_regex_highlighting = false,
	      },
	      incremental_selection = {
	        enable = true,
	        keymaps = {
	          init_selection = "øv",
	          node_incremental = "øf",
	          scope_incremental = "øg",
	          node_decremental = "ød",
	        },
	      },
	    })
	  end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-telescope/telescope-z.nvim",
		"folke/trouble.nvim",  -- make sure trouble is available
		},
		config = function()
		local actions = require("telescope.actions")
		local trouble = require("trouble.sources.telescope")

		require("telescope").setup({
			defaults = {
			layout_strategy = "vertical",
			mappings = {
				i = { ["<c-t>"] = trouble.open },
				n = { ["<c-t>"] = trouble.open },
			},
			path_display = { "smart" },
			},
			extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			},
		})

		-- load extensions after setup
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("z")
		end,
	},


  	"ryanoasis/vim-devicons",
	"scrooloose/nerdtree",
	"jpalardy/vim-slime",
	"vim-scripts/paredit.vim",
	"christoomey/vim-tmux-navigator",
	"skywind3000/asyncrun.vim",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	{ "kyazdani42/nvim-tree.lua", dependencies = { "kyazdani42/nvim-web-devicons" } },

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
	{
	  "nvim-lualine/lualine.nvim",
	  dependencies = { "nvim-tree/nvim-web-devicons" },
	  event = "VeryLazy",
	  config = function()
	    -- === Colors / UI ===
	    vim.g.base16colorspace = 256
	    vim.o.termguicolors = true
	    vim.cmd([[ highlight Comment cterm=italic ]])

	    local lualine_theme
	    if vim.g.color_is_light then
	      lualine_theme = "onelight"
	      vim.cmd("colorscheme base16-one-light")
	    else
	      lualine_theme = "gruvbox"
	      vim.cmd("colorscheme gruvbox")
	    end

	    vim.cmd([[hi LineNr guibg=NONE]])
	    vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])

	    -- === Lualine ===
	    require("lualine").setup({
	      options = {
	        theme = lualine_theme,
	        globalstatus = true,
	      },
	      sections = {
	        lualine_c = {
	          "filename",
	          {
	            "lsp_progress", -- built-in, no deprecations
	          },
	        },
	        lualine_x = {
	          {
	            "lsp_clients",
	            icon = "",
	          },
	          "encoding",
	          "filetype",
	        },
	      },
	    })
	  end,
	},
	{
  		"j-hui/fidget.nvim",
  		opts = {},
	},
	"folke/lsp-colors.nvim",
  	"RRethy/vim-illuminate"
}
)
