"Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  IMPORTS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

" === Core functionality === "
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tommcdo/vim-exchange'
Plug 'wellle/targets.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'liuchengxu/vim-which-key'

" === Editor === "
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'jpalardy/vim-slime'
Plug 'vim-scripts/paredit.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wincent/terminus'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" === Completion === "
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

" === Filetype specific === "
Plug 'masukomi/vim-markdown-folding'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'neovimhaskell/haskell-vim'
Plug 'lervag/vimtex'
Plug 'elmcast/elm-vim'

" === Visual === "
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'gruvbox-community/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/goyo.vim'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  SETTINGS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Turn on syntax highlighting
syntax on 

" For plugins to load correctly
filetype plugin indent on 

let mapleader = ","
let maplocalleader = "\<Space>"

" Security
set modelines=0

" Show line numbers
set number
set relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set belloff=all

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=0 " set to 79 to autowrap after whitespace
set formatoptions=cqrn1 "t - autowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set linebreak

" Cursor motion
set scrolloff=7
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
noremap j gj
noremap gj j
noremap k gk
noremap gk k

" Allow hidden buffers
set hidden


" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

set noswapfile
set undodir=~/.config/nvim/.vimdid
set undofile

set listchars=tab:▸\ ,eol:¬

set clipboard=unnamed

" === TEX === "
let g:tex_flavor='latex'

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Searching
nnoremap / /\v
vnoremap / /\v
set incsearch
set nohlsearch
set ignorecase
set smartcase
if has('nvim')
  set inccommand=nosplit
end

let $FZF_DEFAULT_OPTS='--reverse'

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Haskell Parsing (Alex and Happy)
au BufRead,BufNewFile *.x set syntax=haskell
au BufRead,BufNewFile *.y set syntax=haskell

" === NERDTree === "
let NERDTreeIgnore = ['__pycache__', '\.pyc$','\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store', '.class']
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"

" === Vim Align === "
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" === Vim Wordmotion === "
let g:wordmotion_prefix = '-'

" === Paredit === "
let g:paredit_leader = 'æ'
let g:paredit_electric_return = 0

" === Slime === "
let g:slime_target = "tmux"
let g:slime_no_mappings = 1

" === Rainbow === "
let g:rainbow_active = 1

" === Completion Config === "

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" TODO: find suitable mapping. c-space is mapped in system
" inoremap <silent><expr> <c-æ> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" === Completion Mappings === "

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Diagnostics
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              LAYOUT & DESIGN                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" === LightLine === "
set noshowmode " remove built in INSERT promt, lightlines takes care of this!

let g:lightline = {
   \ 'colorscheme' : 'one',
   \ 'active': {
   \   'left': [ [ 'mode', 'paste' ],
   \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
   \ },
   \ 'component_function': {
   \   'gitbranch': 'FugitiveHead',
   \   'cocstatus': 'coc#status'
   \ },
   \ }

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" === Colors === "
set termguicolors
highlight Comment cterm=italic

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

if filereadable(expand("~/.vimrc_bgtype"))
  source ~/.vimrc_bgtype
endif

hi LineNr guibg=NONE
hi Normal guibg=NONE ctermbg=NONE


" === Snippets === "

let g:snips_author = "Eirik Sæther"
let g:snips_email = "eirik.halvard.95@gmail.com"
let g:snips_github = "https://github.com/eirikhalvard"

let g:UltiSnipsSnippetsDir = '~/.config/nvim/plugged/vim-snippets/UltiSnips'
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips']

" \/ \/ OLD COMPLETION SETUP. \/ \/

" === Snippets === "
" let g:UltiSnipsSnippetsDir = '~/.config/nvim/plugged/vim-snippets/UltiSnips'
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips']

" map <leader>s :Snippets<CR>

" map <leader>os :UltiSnipsEdit<CR>
map <leader>af :ALEFix<CR>
let g:ale_fix_on_save = 1

" let g:ale_linters = { 
" \  'haskell': ['hlint'], 
" \  'tex': ['chktex'] 
" \}

function! FormatHaskell(buffer) abort
    return {
    \   'command': 'fourmolu --indentation 2 --indent-wheres true'
    \}
endfunction

execute ale#fix#registry#Add('fourmolu', 'FormatHaskell', ['haskell'], 'fourmolu for haskell')

let g:ale_linters_explicit = 1
let g:ale_fixers = { 
\  'haskell': ['fourmolu']
\}

" \  'tex': ['latexindent'],
" \  'json': ['fixjson'],
" \  'java': ['google_java_format'],
" \  'markdown': ['prettier'],
"
let g:ale_lint_on_text_changed = 'never'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  MAPPINGS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual ','<CR>
set timeoutlen=500
let g:which_key_map = {}


" === General Mappings === "

map <Left> <C-h>
map <Right> <C-l>
map <Down> }j
map <Up> {k
nnoremap Y y$

" === Leader Key Mappings === "

let g:which_key_map = {
\ 'name' : '🌍 Leader',
\ ' ' : [':Commands', 'commands'],
\ ',' : [':e#', 'previous-file'],
\ 'a' : {
    \ 'name' : '🎮 Actions',
    \ 'h' : 'insert-haskell-expression',
    \ 'i' : [':source ~/.config/nvim/init.vim', 'source-init'],
    \ 's' : [':syntax sync fromstart', 'sync-syntax'],
    \ 'y' : [':CocList -A --normal yank', 'yank-list'],
    \ },
\ 'c' : {
    \ 'name' : '🛠  Compile',
    \ 'a' : 'async-compile',
    \ 'c' : 'compile',
    \ },
\ 'e' : {
    \ 'name' : '💻 Edits',
    \ 'f' : ['z=1<CR>', 'fix-typo'],
    \ 'n' : 'norm-lines',
    \ 'N' : 'norm-non-empty-lines',
    \ 'r' : 'raise-word-to-parenexp',
    \ 's' : 'substitute',
    \ 'S' : 'substitute-thing',
    \ },
\ 'f' : {
    \ 'name' : '💿 Files',
    \ 'b' : [':Buffers', 'buffers'],
    \ 'c' : [':Files ~/.config', 'config-files'],
    \ 'f' : [':Files', 'files'],
    \ 'g' : [':GFiles', 'git-files'],
    \ 'H' : [':tabfirst', 'first-tab'],
    \ 'h' : [':tabprevious', 'previous-tab'],
    \ 'J' : [':blast', 'last-buffer'],
    \ 'j' : [':bnext', 'next-buffer'],
    \ 'K' : [':bfirst', 'first-buffer'],
    \ 'k' : [':bprevious', 'previous-buffer'],
    \ 'L' : [':tablast', 'last-tab'],
    \ 'l' : [':tabnext', 'next-tab'],
    \ 'N' : [':clast', 'last-quickfix'],
    \ 'n' : [':cnext', 'next-quickfix'],
    \ 'P' : [':cfirst', 'first-quickfix'],
    \ 'p' : [':cprevious', 'previous-quickfix'],
    \ },
\ 'g' : {
    \ 'name' : '🐙 Git',
    \ 'b' : [':Git blame', 'blame'],
    \ 'c' : [':Git commit', 'commit'],
    \ 'f' : [':Git fetch', 'fetch'],
    \ 'g' : [':Git', 'git-menu'],
    \ 'h' : [':GBrowse', 'browse-github'],
    \ 'l' : [':Git pull', 'pull'],
    \ 'p' : [':Git push', 'push'],
    \ 'w' : [':Gwrite', 'stage-file'],
    \ },
\ 'h' : {
    \ 'name' : '🏳️  Help',
    \ 'h' : [':Helptags', 'help'],
    \ 'm' : [':Maps', 'mappings'],
    \ },
\ 'l' : {
    \ 'name' : '🚀 LSP',
    \ 'a' : ['<Plug>(coc-codeaction-selected)', 'codeaction'],
    \ 'af' : ['<Plug>(coc-codeaction)', 'codeaction-file'],
    \ 'C' : [':Fold', 'fold-close'],
    \ 'd' : ['<Plug>(coc-diagnostic-next)', 'diagnostic-next'],
    \ 'D' : ['<Plug>(coc-diagnostic-prev)', 'diagnostic-prev'],
    \ 'e' : ['<Plug>(coc-codelens-action)', 'eval-codelens-action'],
    \ 'F' : [':Format', 'format'],
    \ 'f' : ['<Plug>(coc-format-selected)', 'format-selected'],
    \ 'g' : {
      \ 'name' : '🏂 Go',
      \ 'd' : ['<Plug>(coc-definition)', 'definition'],
      \ 'i' : ['<Plug>(coc-implementation)', 'implementation'],
      \ 'r' : ['<Plug>(coc-references)', 'references'],
      \ 't' : ['<Plug>(coc-type-definition)', 'type-definition'],
      \ },
    \ 'l' : [':CocList', 'coc-list'],
    \ 'O' : [':OR', 'organize-imports'],
    \ 'q' : ['<Plug>(coc-fix-current)', 'fix-current'],
    \ 'R' : ['<Plug>(coc-restart)', 'coc-restart'],
    \ 'r' : ['<Plug>(coc-rename)', 'rename'],
    \ 's' : ['K', 'show-documentation (K)'],
    \ },
\ 'o' : {
    \ 'name' : '🛹 Open',
    \ 'b' : [':e ~/.config/shell/bash_profile', 'bash-profile'],
    \ 'c' : [':CocConfig', 'coc-config'],
    \ 'f' : 'ftplugin-filetype',
    \ 'i' : [':e ~/.config/nvim/init.vim', 'init.vim'],
    \ 's' : [':UltiSnipsEdit', 'open-snippets'],
    \ },
\ 'Q' : [':q!', 'force-quit-file'],
\ 'q' : [':q', 'quit-file'],
\ 'r' : {
    \ 'name' : '🦀 Resources',
    \ 's' : {
      \ 'name' : '🐸 Slime',
      \ 'b' : [',rsmab', 'send-bracket'],
      \ 'c' : ['<Plug>SlimeConfig', 'config'],
      \ 'm' : ['<Plug>SlimeMotionSend', 'send-motion'],
      \ 'p' : ['<Plug>SlimeParagraphSend', 'send-paragraph'],
      \ 'q' : [',rsmiq', 'send-inside-quotes'],
      \ 's' : 'send',
      \ },
    \ },
\ 'S' : [':CocList snippets', 'insert-snippet'],
\ 't' : {
    \ 'name' : '🔘 Toggles',
    \ 'e' : [':CocCommand explorer', 'explorer'],
    \ 'g' : [':Goyo', 'goyo'],
    \ 's' : {
        \ 'name' : '📝 Spell',
        \ 'e' : [':set spelllang=en', 'english'],
        \ 'n' : [':set spelllang=nb', 'norwegian'],
        \ 's' : [':set spell!', 'toggle-spell'],
        \ },
    \ 't' : [':NERDTreeToggle', 'tree'],
    \ 'w' : [':set list!', 'whitespace'],
    \ },
\ 'w' : [':w', 'write-file'],
\ }

" Some commands are to complex to be written directly in
" the which-key map. Either there is an ex command that
" uses more complex features, or we have custom implementation
" for visual mode and normal mode
map <leader>ah :read !ghead -n -1 < <(ghc -e "")<Left><Left>
map <leader>ca :w! \| AsyncRun compiler "%" <CR>
map <leader>cc :w! \| !compiler "<C-r>%"<CR>
nnoremap <leader>er diwvabp
vnoremap <leader>er dvabp
map <leader>en :g/.*/norm 
map <leader>eN :g/..*/norm 
nnoremap <leader>es :%s//g<Left><Left>
vnoremap <leader>es :s/\%V/g<Left><Left>
nnoremap <leader>eS yiw:%s/\<<C-r>"\>//g<Left><Left>
vnoremap <leader>eS y:%s/\<<C-r>"\>//g<Left><Left>
map <leader>of :e ~/.config/nvim/ftplugin/<C-r>=&filetype<CR>.vim<CR>
xmap <leader>rss <Plug>SlimeRegionSend
nmap <leader>rss <Plug>SlimeParagraphSend

nmap øf :Files<CR>
nmap ør :Rg<CR>
nmap gd <Plug>(coc-definition)


" Formatting selected code.
" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>la  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>le  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>lc  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>lo  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>ls  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>lj  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>lk  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>lp  :<C-u>CocListResume<CR>


call which_key#register(',', "g:which_key_map")
