vim.g.color_is_light = false

vim.g.mapleader = ","
vim.g.maplocalleader = " "

vim.opt.modelines = 0
vim.opt.number = true
vim.opt.relativenumber = true

-- Show file stats
vim.opt.ruler = true

-- Blink cursor on error instead of beeping (grr)
vim.opt.belloff = "all"
vim.opt.encoding = "utf-8"

-- Whitespace
vim.opt.wrap = true
vim.opt.textwidth = 0 -- set to 79 to autowrap after whitespace
vim.opt.formatoptions = "cqrn1" -- t - autowrap
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.shiftround = false
vim.opt.linebreak = true
vim.opt.signcolumn = "yes"

-- Cursor motion
vim.opt.scrolloff = 4
vim.opt.backspace = "indent,eol,start"
vim.opt.matchpairs:append("<:>")

-- Allow hidden buffers
vim.opt.hidden = true

-- Rendering
vim.opt.ttyfast = true
vim.opt.updatetime = 100

-- Status bar
vim.opt.laststatus = 3

-- Last line
vim.opt.showmode = true
vim.opt.showcmd = true

vim.opt.swapfile = false
-- vim.opt.undodir = "~/.config/nvim/.vimdid"
vim.opt.undofile = true
vim.opt.listchars = [[tab:▸\ ,eol:¬]]
vim.opt.clipboard = "unnamed"

function _G.dump(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(unpack(objects))
	return ...
end

-- Searching
vim.api.nvim_set_keymap("n", "/", [[/\v]], { noremap = true })
vim.api.nvim_set_keymap("v", "/", [[/\v]], { noremap = true })
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "nosplit"

vim.g.builtin_lsp = true
vim.o.completeopt = "menuone,noselect"

-- Highlight on yank
vim.cmd [[au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}]]

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
	            Text = "", Method = "", Function = "", Constructor = "",
	            Field = "ﰠ", Variable = "", Class = "ﴯ", Interface = "",
	            Module = "", Property = "ﰠ", Unit = "塞", Value = "",
	            Enum = "", Keyword = "", Snippet = "", Color = "",
	            File = "", Reference = "", Folder = "", EnumMember = "",
	            Constant = "", Struct = "פּ", Event = "", Operator = "",
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
	            icon = "",
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

-- " === TEX === "
vim.g.tex_flavor = "latex"
-- Runs a script that cleans out tex build files
-- whenever I close out of a .tex file.
vim.api.nvim_command("autocmd VimLeave *.tex !texclear %")

vim.env.FZF_DEFAULT_OPTS = "--reverse"

-- " Haskell Parsing (Alex and Happy)
vim.cmd([[au BufRead,BufNewFile *.x set syntax=haskell]])
vim.cmd([[au BufRead,BufNewFile *.y set syntax=haskell]])

-- " === Vim Align === "
vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = false })
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { noremap = false })

-- " === Vim Wordmotion === "
vim.g.wordmotion_prefix = "-"

-- " === Nvim Tree === "
require("nvim-tree").setup {
  git = {
    ignore = true
  }
}

-- " === Paredit === "
vim.g.paredit_leader = "æ"
vim.g.paredit_electric_return = 0

-- " === Slime === "
vim.g.slime_target = "tmux"
vim.g.slime_no_mappings = 1

-- " === Rainbow Parenthesis === "
vim.g.rainbow_active = 1

-- " === Snippets === "
vim.g.snips_author = "Eirik Sæther"
vim.g.snips_email = "eirik.halvard.95@gmail.com"
vim.g.snips_github = "https://github.com/eirikhalvard"

local wk = require("which-key")

wk.setup({
  icons = { mappings = false },
})

wk.add({
  { "<leader>", group = "Leader" },

  { "<leader><space>", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<leader>,", "<cmd>e #<cr>", desc = "Previous file" },

  { "<leader>c", group = "Compile" },
  { "<leader>ca", desc = "Async compile" },
  { "<leader>cc", desc = "Compile" },

  { "<leader>d", group = "Do" },
  { "<leader>df", vim.lsp.buf.code_action, desc = "Code action" },
  { "<leader>di", "<cmd>luafile ~/.config/nvim/init.lua<cr>", desc = "Source init" },
  { "<leader>ds", "<cmd>syntax sync fromstart<cr>", desc = "Sync syntax" },

  { "<leader>e", group = "Edits" },
  { "<leader>ef", "z=1", desc = "Fix typo" },
  { "<leader>es", desc = "Substitute" },
  { "<leader>eS", desc = "Substitute word" },

  { "<leader>f", group = "Files" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
  { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old files" },
  { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Search" },
  { "<leader>fz", "<cmd>Telescope z<cr>", desc = "Z" },

  { "<leader>g", group = "Git" },
  { "<leader>gg", "<cmd>Git<cr>", desc = "Git status" },
  { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame" },
  { "<leader>gp", "<cmd>Git push<cr>", desc = "Push" },

  { "<leader>h", group = "Help" },
  { "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },

  { "<leader>o", group = "Open" },
  {
    "<leader>of",
    function()
      vim.cmd("e ~/.config/nvim/ftplugin/" .. vim.bo.filetype .. ".vim")
    end,
    desc = "ftplugin file",
  },

  { "<leader>s", group = "LSP" },
  { "<leader>sa", vim.lsp.buf.code_action, desc = "Code action" },
  { "<leader>sr", vim.lsp.buf.rename, desc = "Rename" },
  { "<leader>sf", function() vim.lsp.buf.format({ async = true }) end, desc = "Format" },
  { "<leader>ss", "<cmd>TroubleToggle<cr>", desc = "Trouble" },

  { "<leader>t", group = "Toggles" },
  { "<leader>tg", "<cmd>Goyo<cr>", desc = "Goyo" },
  { "<leader>tw", "<cmd>set list!<cr>", desc = "Whitespace" },

  { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
  { "<leader>Q", "<cmd>q!<cr>", desc = "Force quit" },
})

vim.keymap.set("n", "<leader>dh",
  [[:read !ghead -n -1 < <(ghc -e "")<Left><Left>]],
  { desc = "Insert Haskell expr" }
)

vim.keymap.set("n", "<leader>ca",
  ":w! | AsyncRun compiler \"%\"<cr>",
  { desc = "Async compile" }
)

vim.keymap.set("n", "<leader>cc",
  ":w! | !compiler \"%\"<cr>",
  { desc = "Compile" }
)

vim.keymap.set({ "n", "v" }, "<leader>er", "dvabp", { desc = "Raise word" })

vim.keymap.set("x", "<leader>rss", "<Plug>SlimeRegionSend", { desc = "Slime region" })
vim.keymap.set("n", "<leader>rss", "<Plug>SlimeParagraphSend", { desc = "Slime paragraph" })

-- Better movement
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "gj", "j")
vim.keymap.set("n", "gk", "k")

-- Yank to end of line
vim.keymap.set("n", "Y", "y$")

-- Arrow keys -> tmux / splits
vim.keymap.set("", "<Left>", "<C-h>")
vim.keymap.set("", "<Right>", "<C-l>")
vim.keymap.set("", "<Up>", "{k")
vim.keymap.set("", "<Down>", "}j")

-- CMD-S (iTerm)
vim.keymap.set({ "n", "i" }, "<F10>", "<cmd>w<cr>", { desc = "Save" })

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })
vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", { desc = "References" })
