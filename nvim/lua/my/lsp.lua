local nvim_lsp = require("lspconfig")

-- HASKELL
nvim_lsp.hls.setup({
	settings = {
		haskell = {
			formattingProvider = "fourmolu",
		},
	},
})

-- JAVASCRIPT / TYPESCRIPT
nvim_lsp.tsserver.setup({})

-- PYTHON
nvim_lsp.pylsp.setup({})

-- JSON
nvim_lsp.jsonls.setup({})

-- BASH
nvim_lsp.bashls.setup({})

-- === CMP === --

local luasnip = require("luasnip")
local cmp = require("cmp")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  completion = { 
    completeopt = 'menu,menuone,noinsert,noselect' 
  },
  mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
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
    format = require('lspkind').cmp_format({
      -- defines how annotations are shown
      -- default: symbol
      -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      mode = 'symbol_text',

      -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      maxwidth = 50,

      symbol_map = { 
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
      },

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        -- ...
        return vim_item
      end
    })
  },
  
  sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "tmux" },
  }
})

require("luasnip.loaders.from_vscode").lazy_load()

-- === TROUBLE === --
require("trouble").setup({})

-- TREE SITTER
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    "haskell", "elm", "lua", "python", "r", "scala", 
    "json", "comment", "markdown", "dockerfile", "yaml",
    "bash", "vim", "css", "html", 
  },
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
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
}
-- set foldmethod=expr
-- set foldexpr=nvim_treesitter#foldexpr()
