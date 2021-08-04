vim.g.mapleader = ","
vim.g.maplocalleader = " "

require('my.plugins')
require('my.mappings')
require('my.lsp')
require('my.lualine')
require('my.misc')
require('my.options')

-- TODO
-- setup telescope
-- setup mappings
-- setup lsp, remove coc
-- setup lualine
-- fix color-script setup

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
vim.api.nvim_set_var("tex_flavor", "latex")
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
vim.api.nvim_set_var("wordmotion_prefix", "-")

-- " === Nvim Tree === "
vim.api.nvim_set_var("nvim_tree_gitignore", 1)

-- " === Paredit === "
vim.api.nvim_set_var("paredit_leader", "æ")
vim.api.nvim_set_var("paredit_electric_return", 0)

-- " === Slime === "
vim.api.nvim_set_var("slime_target", "tmux")
vim.api.nvim_set_var("slime_no_mappings", 1)

-- " === Rainbow Parenthesis === "
vim.api.nvim_set_var("rainbow_active", 1)

-- """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- "                              LAYOUT & DESIGN                               "
-- """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

-- " === LightLine === "
-- set noshowmode " remove built in INSERT promt, lightlines takes care of this!

-- let g:lightline = {
--    \ 'colorscheme' : 'one',
--    \ 'active': {
--    \   'left': [ [ 'mode', 'paste' ],
--    \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
--    \ },
--    \ 'component_function': {
--    \   'gitbranch': 'FugitiveHead',
--    \   'cocstatus': 'coc#status'
--    \ },
--    \ }

-- " Use auocmd to force lightline update.
-- autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

-- " === Colors === "
-- set termguicolors
-- highlight Comment cterm=italic

-- if filereadable(expand("~/.vimrc_background"))
--   let base16colorspace=256
--   source ~/.vimrc_background
-- endif

-- if filereadable(expand("~/.vimrc_bgtype"))
--   source ~/.vimrc_bgtype
-- endif

-- hi LineNr guibg=NONE
-- hi Normal guibg=NONE ctermbg=NONE


-- " === Snippets === "

-- let g:snips_author = "Eirik Sæther"
-- let g:snips_email = "eirik.halvard.95@gmail.com"
-- let g:snips_github = "https://github.com/eirikhalvard"

-- let g:UltiSnipsSnippetsDir = '~/.config/nvim/plugged/vim-snippets/UltiSnips'
-- let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips']

-- " \/ \/ OLD COMPLETION SETUP. \/ \/

-- " === Snippets === "
-- " let g:UltiSnipsSnippetsDir = '~/.config/nvim/plugged/vim-snippets/UltiSnips'
-- " let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips']

-- " map <leader>s :Snippets<CR>

-- " map <leader>os :UltiSnipsEdit<CR>
-- map <leader>af :ALEFix<CR>
-- let g:ale_fix_on_save = 1

-- " let g:ale_linters = { 
-- " \  'haskell': ['hlint'], 
-- " \  'tex': ['chktex'] 
-- " \}

-- function! FormatHaskell(buffer) abort
--     return {
--     \   'command': 'fourmolu --indentation 2 --indent-wheres true'
--     \}
-- endfunction

-- execute ale#fix#registry#Add('fourmolu', 'FormatHaskell', ['haskell'], 'fourmolu for haskell')

-- let g:ale_linters_explicit = 1
-- let g:ale_fixers = { 
-- \  'haskell': ['fourmolu']
-- \}

-- " \  'tex': ['latexindent'],
-- " \  'json': ['fixjson'],
-- " \  'java': ['google_java_format'],
-- " \  'markdown': ['prettier'],
-- "
-- let g:ale_lint_on_text_changed = 'never'
