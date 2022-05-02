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
