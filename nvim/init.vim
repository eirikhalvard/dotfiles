" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off
let g:python3_host_prog = '/anaconda3/bin/python3'

call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'itchyny/lightline.vim'
Plug 'wincent/terminus'
Plug 'masukomi/vim-markdown-folding'
Plug 'wellle/targets.vim'
Plug 'tommcdo/vim-exchange'
Plug 'junegunn/fzf.vim'
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'honza/vim-snippets'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-latex/vim-latex'
Plug 'w0rp/ale'
" Plug 'davidhalter/jedi-vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'jpalardy/vim-slime'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'vim-scripts/paredit.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neovimhaskell/haskell-vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'ervandew/supertab'

" Themes
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'rakr/vim-one'

call plug#end()
"
syntax on " Turn on syntax highlighting

filetype plugin indent on " For plugins to load correctly

let mapleader = ","

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
set textwidth=79
set formatoptions=cqrn1 "t - autowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=7
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd


set clipboard=unnamed

" === TEX === "
let g:tex_flavor='latex'

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

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" === NERDTree === "
let NERDTreeIgnore = ['__pycache__', '\.pyc$','\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store', '.class']
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
map <leader>tt :NERDTreeToggle<CR>
map <leader>tf :NERDTreeFocus<CR>

" === Vim Align === "
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" === LightLine === "
set noshowmode " remove built in INSERT promt, lightlines takes care of this!
" let g:lightline.active = { 
"       \ 'left': [ ['mode', 'readonly'], ['filename_with_icon', 'modified' ] ],
"       \ 'right': [ ['lineinfo'], ['status_diagnostic'] ]
"       \ }
let g:lightline = {
   \ 'colorscheme' : 'challenger_deep',
   \ 'active': {
   \   'left': [ [ 'mode', 'paste' ],
   \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
   \ },
   \ 'component_function': {
   \   'cocstatus': 'coc#status'
   \ },
   \ }



" === Paredit === "
let g:paredit_leader = 'æ'


" === Slime === "
let g:slime_target = "tmux"
let g:slime_no_mappings = 1
xmap øss <Plug>SlimeRegionSend
nmap øss <Plug>SlimeParagraphSend
nmap øsc <Plug>SlimeConfig
nmap øsm <Plug>SlimeMotionSend

" === Goyo Limelight ==="
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  Limelight
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  Limelight!
endfunction

autocmd! User GoyoEnter()
autocmd! User GoyoLeave()

" === General Mappings === "
imap fd <Esc>
map √ }
map ª {
imap √ {
imap ª }
imap ı \

" Make Y function like D and C.
nnoremap Y y$

" === Leader mappings === "
map <leader>w :w<CR>
map <silent> <leader><space> :let @/=''<CR> " clear search
map <leader>s :%s/
map <silent> <leader>tg :Goyo<CR>
map <silent> <leader>tl :Limelight!!<CR>
map <silent> <leader>tc :call ToggleFocusColor()<CR>
map <silent> <leader><leader> :e#<CR>

" === FZF mappings === "
map øb :Buffers<CR>
map øl :Lines<CR>
map øh :BLines<CR>
map øf :Files<CR>
map ør :Rg<CR>
map øy yiw:Rg <C-r>"<CR>

" === COC === "

" set signcolumn=yes

" " confirm snippet with enter
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
"   \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" nmap <silent> <leader>cg <Plug>(coc-definition)
" nmap <silent> <leader>ct <Plug>(coc-type-definition)
" nmap <silent> <leader>ci <Plug>(coc-implementation)
" nmap <silent> <leader>co <Plug>(coc-references)
" nnoremap <silent> <leader>cs :call <SID>show_documentation()<CR>
" nmap <leader>cr <Plug>(coc-rename)
" nmap <silent> <leader>ck <Plug>(coc-diagnostic-prev)
" nmap <silent> <leader>cj <Plug>(coc-diagnostic-next)
" xmap <leader>cf  <Plug>(coc-format-selected)
" nmap <leader>cf  <Plug>(coc-format-selected)

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>ca  <Plug>(coc-codeaction-selected)
" nmap <leader>ca  <Plug>(coc-codeaction-selected)

" " Remap for do codeAction of current line
" nmap <leader>cl  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>cc  <Plug>(coc-fix-current)

" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')

" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" === Language Server === "
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }
map <Leader>cm :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
map <Leader>cd :call LanguageClient#textDocument_definition()<CR>
map <Leader>cr :call LanguageClient#textDocument_rename()<CR>
map <Leader>cf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>cb :call LanguageClient#textDocument_references()<CR>
map <Leader>ca :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>cs :call LanguageClient#textDocument_documentSymbol()<CR>


hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap

let g:deoplete#enable_at_startup = 1


" === ALE === "
nnoremap <leader>o :ALEToggle<CR>
let g:ale_enabled = 0
let g:ale_sign_column_always = 1   "keep gutter open
let g:ale_haskell_hie_executable = 'hie-wrapper'
let g:ale_linters = { 'haskell': ['hie', 'hlint'] }
let g:ale_fixers = { 'haskell': ['hlint'] }
let g:ale_lint_on_text_changed = 'never'

" === Colors === "
let g:one_allow_italics = 1 " I love italic for comments
set termguicolors
highlight Comment cterm=italic

let g:focuscolour = 2
function! ToggleFocusColor()
  if (g:focuscolour == 0)
    colorscheme one
    set background=light
    let g:focuscolour = 1
  elseif (g:focuscolour == 1)
    colorscheme one
    set background=dark
    let g:focuscolour = 2
  elseif (g:focuscolour == 2)
    colorscheme challenger_deep
    hi LineNr guibg=NONE
    hi Normal guibg=NONE ctermbg=NONE
    let g:focuscolour = 0
  endif
endfunc

call ToggleFocusColor()

