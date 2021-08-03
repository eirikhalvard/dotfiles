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

vim.g.builtin_lsp = true

vim.g.mapleader = [[,]]
vim.g.maplocalleader = [[ ]]

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
-- Runs a script that cleans out tex build files whenever I close out of a .tex file.
vim.api.nvim_command("autocmd VimLeave *.tex !texclear %")

-- let $FZF_DEFAULT_OPTS='--reverse'

-- " Remap help key.
-- inoremap <F1> <ESC>:set invfullscreen<CR>a
-- nnoremap <F1> :set invfullscreen<CR>
-- vnoremap <F1> :set invfullscreen<CR>

-- " Haskell Parsing (Alex and Happy)
-- au BufRead,BufNewFile *.x set syntax=haskell
-- au BufRead,BufNewFile *.y set syntax=haskell

-- " === NERDTree === "
-- let NERDTreeIgnore = ['__pycache__', '\.pyc$','\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store', '.class']
-- let NERDTreeShowHidden=1
-- let g:NERDTreeWinPos="left"

-- " === Vim Align === "
-- xmap ga <Plug>(EasyAlign)
-- nmap ga <Plug>(EasyAlign)

-- " === Vim Wordmotion === "
-- let g:wordmotion_prefix = '-'

-- " === Paredit === "
-- let g:paredit_leader = 'æ'
-- let g:paredit_electric_return = 0

-- " === Slime === "
-- let g:slime_target = "tmux"
-- let g:slime_no_mappings = 1

-- " === Rainbow === "
-- let g:rainbow_active = 1

-- " === Completion Config === "

-- " Some servers have issues with backup files, see #649.
-- set nobackup
-- set nowritebackup

-- " Give more space for displaying messages.
-- set cmdheight=2

-- " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- " delays and poor user experience.
-- set updatetime=300

-- " Don't pass messages to |ins-completion-menu|.
-- set shortmess+=c

-- " Always show the signcolumn, otherwise it would shift the text each time
-- " diagnostics appear/become resolved.
-- if has("patch-8.1.1564")
--   " Recently vim can merge signcolumn and number column into one
--   set signcolumn=number
-- else
--   set signcolumn=yes
-- endif

-- " Use tab for trigger completion with characters ahead and navigate.
-- " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- " other plugin before putting this into your config.
-- " inoremap <silent><expr> <TAB>
-- "       \ pumvisible() ? "\<C-n>" :
-- "       \ <SID>check_back_space() ? "\<TAB>" :
-- "       \ coc#refresh()
-- inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

-- inoremap <silent><expr> <TAB>
--       \ pumvisible() ? coc#_select_confirm() :
--       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
--       \ <SID>check_back_space() ? "\<TAB>" :
--       \ coc#refresh()

-- inoremap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"
-- inoremap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"

-- function! s:check_back_space() abort
--   let col = col('.') - 1
--   return !col || getline('.')[col - 1]  =~# '\s'
-- endfunction

-- " Use <c-space> to trigger completion.
-- " TODO: find suitable mapping. c-space is mapped in system
-- " inoremap <silent><expr> <c-æ> coc#refresh()

-- " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
-- " position. Coc only does snippet and additional edit on confirm.
-- " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
-- if exists('*complete_info')
--   inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
-- else
--   inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
-- endif

-- " === Completion Mappings === "

-- function! s:show_documentation()
--   if (index(['vim','help'], &filetype) >= 0)
--     execute 'h '.expand('<cword>')
--   else
--     call CocActionAsync('doHover')
--   endif
-- endfunction

-- " Highlight the symbol and its references when holding the cursor.
-- autocmd CursorHold * silent call CocActionAsync('highlight')

-- augroup mygroup
--   autocmd!
--   " Setup formatexpr specified filetype(s).
--   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
--   " Update signature help on jump placeholder.
--   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
-- augroup end

-- " Diagnostics
-- " Use K to show documentation in preview window.
-- nnoremap <silent> K :call <SID>show_documentation()<CR>


-- " Map function and class text objects
-- " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
-- xmap if <Plug>(coc-funcobj-i)
-- omap if <Plug>(coc-funcobj-i)
-- xmap af <Plug>(coc-funcobj-a)
-- omap af <Plug>(coc-funcobj-a)
-- xmap ic <Plug>(coc-classobj-i)
-- omap ic <Plug>(coc-classobj-i)
-- xmap ac <Plug>(coc-classobj-a)
-- omap ac <Plug>(coc-classobj-a)

-- " Use CTRL-S for selections ranges.
-- " Requires 'textDocument/selectionRange' support of language server.
-- nmap <silent> <C-s> <Plug>(coc-range-select)
-- xmap <silent> <C-s> <Plug>(coc-range-select)

-- " Add `:Format` command to format current buffer.
-- command! -nargs=0 Format :call CocAction('format')

-- " Add `:Fold` command to fold current buffer.
-- command! -nargs=? Fold :call     CocAction('fold', <f-args>)

-- " Add `:OR` command for organize imports of the current buffer.
-- command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

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
