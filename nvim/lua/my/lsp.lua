local nvim_lsp = require("lspconfig")

-- HASKELL
nvim_lsp.hls.setup({
	settings = {
		haskell = {
			formattingProvider = "fourmolu",
		},
	},
})
-- vim.g.ormolu_command = "fourmolu"

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
  sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "tmux" },
  }
})
require("luasnip.loaders.from_vscode").lazy_load()

-- === TROUBLE === --
require("trouble").setup({})
