vim.g.mapleader = ","
vim.g.maplocalleader = " "

require('my.compiled_colortype')
require('my.plugins')
require('my.mappings')
require('my.lsp')
require('my.lualine')
require('my.misc')
require('my.options')

-- TODO
-- setup telescope
-- setup lsp, remove coc

vim.g.builtin_lsp = true

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

-- Cursor motion
vim.opt.scrolloff = 4
vim.opt.backspace = "indent,eol,start"
vim.opt.matchpairs:append("<:>")

-- Allow hidden buffers
vim.opt.hidden = true

-- Rendering
vim.opt.ttyfast = true

-- Status bar
vim.opt.laststatus = 2

-- Last line
vim.opt.showmode = true
vim.opt.showcmd = true

vim.opt.swapfile = false
-- vim.opt.undodir = "~/.config/nvim/.vimdid"
vim.opt.undofile = true
vim.opt.listchars = [[tab:▸\ ,eol:¬]]
vim.opt.clipboard = "unnamed"

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
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

-- " === TEX === "
vim.g.tex_flavor = "latex"
-- Runs a script that cleans out tex build files 
-- whenever I close out of a .tex file.
vim.api.nvim_command("autocmd VimLeave *.tex !texclear %")

vim.env.FZF_DEFAULT_OPTS = "--reverse"

  -- " Haskell Parsing (Alex and Happy)
vim.cmd [[au BufRead,BufNewFile *.x set syntax=haskell]]
vim.cmd [[au BufRead,BufNewFile *.y set syntax=haskell]]

-- " === Vim Align === "
vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = false })
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { noremap = false })

-- " === Vim Wordmotion === "
vim.g.wordmotion_prefix = "-"

-- " === Nvim Tree === "
vim.g.nvim_tree_gitignore = 1

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
-- vim.g.UltiSnipsSnippetsDir = "~/.config/nvim/plugged/vim-snippets/UltiSnips"
-- vim.g.UltiSnipsSnippetDirectories = "~/.config/nvim/plugged/vim-snippets/UltiSnips"

-- " === Ale === "
vim.api.nvim_set_var("ale_fix_on_save", 1)
vim.g.ale_linters_explicit = 1
vim.g.ale_fixerss = { haskell =  { "fourmolu" }  }
-- old linters:
-- " \  'tex': ['latexindent'],
-- " \  'json': ['fixjson'],
-- " \  'java': ['google_java_format'],
-- " \  'markdown': ['prettier'],
-- "
-- let g:ale_lint_on_text_changed = 'never'

vim.cmd([[
function! FormatHaskell(buffer) abort
    return {
    \   'command': 'fourmolu --indentation 2 --indent-wheres true'
    \}
endfunction
execute ale#fix#registry#Add('fourmolu', 'FormatHaskell', ['haskell'], 'fourmolu for haskell')
]])

-- """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- "                              LAYOUT & DESIGN                               "
-- """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

-- " === Color Scheme === "
vim.g.base16colorspace = 256
vim.o.termguicolors = true
vim.cmd [[ highlight Comment cterm=italic ]]

if vim.g.color_is_light then
  lualine_colorscheme = "onelight"
  vim.g.colors_name = "base16-one-light"
else
  lualine_colorscheme = "gruvbox"
  vim.g.colors_name = "gruvbox"
end

vim.cmd [[hi LineNr guibg=NONE ]]
vim.cmd [[hi Normal guibg=NONE ctermbg=NONE ]]

-- " === Lualine === "
require('lualine').setup{ 
  options = { theme = lualine_colorscheme } 
}
