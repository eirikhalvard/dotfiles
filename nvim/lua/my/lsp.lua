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

-- LUA
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = '/Users/Eirik/Drive/Skole/Prosjekter/Lua/lua-language-server'

-- local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"
-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")

-- nvim_lsp.sumneko_lua.setup {
--   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = runtime_path
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'}
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true)
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {enable = false}
--     }
--   }
-- }

-- NULL LS (general)

-- local null_ls = require("null-ls")

-- -- register any number of sources simultaneously
-- local sources = {
-- 	null_ls.builtins.formatting.prettier,
-- 	null_ls.builtins.code_actions.gitsigns,
-- 	null_ls.builtins.formatting.stylua,
-- }

-- null_ls.config({ sources = sources })
-- nvim_lsp["null-ls"].setup({})

-- " === Ale === "
-- vim.api.nvim_set_var("ale_fix_on_save", 1)
-- vim.g.ale_linters_explicit = 1
-- vim.g.ale_fixerss = { haskell =  { "fourmolu" }  }

-- old linters:
-- " \  'tex': ['latexindent'],
-- " \  'json': ['fixjson'],
-- " \  'java': ['google_java_format'],
-- " \  'markdown': ['prettier'],
-- "
-- let g:ale_lint_on_text_changed = 'never'

-- === CMP === --
local luasnip = require("luasnip")
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		["<Tab>"] = function(fallback)
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
			elseif luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
			elseif luasnip.jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "tmux" },
	},
})

-- === TROUBLE === --
require("trouble").setup({})
