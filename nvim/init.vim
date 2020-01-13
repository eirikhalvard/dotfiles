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

" === Editor === "
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'jpalardy/vim-slime'
Plug 'vim-scripts/paredit.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wincent/terminus'

" === Completion === "
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" === Filetype specific === "
Plug 'vim-latex/vim-latex'
Plug 'masukomi/vim-markdown-folding'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'neovimhaskell/haskell-vim'

" === Visual === "
Plug 'itchyny/lightline.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'rakr/vim-one'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  SETTINGS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Turn on syntax highlighting
syntax on 

" For plugins to load correctly
filetype plugin indent on 

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
noremap k gk

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

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

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

" === Vim Wordmotion === "
let g:wordmotion_prefix = '-'

" === Paredit === "
let g:paredit_leader = 'æ'
let g:paredit_electric_return = 0

" === Slime === "
let g:slime_target = "tmux"
let g:slime_no_mappings = 1

" === Snippets === "
let g:UltiSnipsSnippetsDir = '~/.config/nvim/plugged/vim-snippets/UltiSnips'
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips']


" === Rainbow === "
let g:rainbow_active = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  MAPPINGS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" === General Mappings === "
map √ }
map ª {
imap √ {
imap ª }
imap ı \
imap ﬁ ->
map <Left> <C-h>
map <Right> <C-l>
map <Down> }j
map <Up> {k
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

nnoremap Y y$

" substitute in buffer or selection
nnoremap S :%s//g<Left><Left>
vnoremap S <ESC>:%s/\%V/g<Left><Left>

" substitute selection or word under cursor
nnoremap gS yiw:%s/<C-r>"//g<Left><Left>
vnoremap gS y:%s/<C-r>"//g<Left><Left>

" === Leader mappings === "
map <leader>w :w<CR>
map <silent> <leader>s :Snippets<CR>
map <silent> <leader><leader> :e#<CR>

" === Toggles (t) === "
map <silent> <leader>tc  :call ToggleFocusColor()<CR>
map <silent> <leader>ta  :ALEToggle<CR>
map <silent> <leader>tss :set spell<CR>
map <silent> <leader>tsn :set spelllang=nb<CR>
map <silent> <leader>tse :set spelllang=en<CR>

" === Actions (a) === "
map <leader>ai :source ~/.config/nvim/init.vim<CR>
map <leader>as :syntax sync fromstart<CR>
map <leader>ac :w! \| !compiler <C-r>%<CR>
map <leader>af :ALEFix<CR>
map <leader>ah :read !ghead -n -1 < <(ghc -e "")<Left><Left>
" map <leader>at :!ctags -R . -- generate tags. defined in ftplugin
" map <leader>ap   -- preview. defined in ftplugin


" === Opens (o) === "
map <leader>os :UltiSnipsEdit<CR>
map <leader>ot :Tags<CR>
map <leader>oi :e ~/.config/nvim/init.vim<CR>
map <leader>of :e ~/.config/nvim/ftplugin/<C-r>=&filetype<CR>.vim<CR>
map <leader>ob :e ~/.bash_profile<CR>

" === Help (h) === "
map <leader>ht :Helptags<CR>
map <leader>hm :Maps<CR>

" === FZF mappings === "
map øb :Buffers<CR>
map øl :Lines<CR>
map øh :BLines<CR>
map øf :Files<CR>
map ør :Rg<CR>
map øy yiw:Rg <C-r>"<CR>

" === Slime mappings (øs) === "
xmap øss <Plug>SlimeRegionSend
nmap øss <Plug>SlimeParagraphSend
nmap øsc <Plug>SlimeConfig
nmap øsm <Plug>SlimeMotionSend
nmap øsq øsmiq
nmap øsb øsmab

" === DEOPLETE === "
let g:deoplete#enable_at_startup = 1

" === ALE === "
hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap

let g:ale_enabled = 0
let g:ale_sign_column_always = 1   "keep gutter open
let g:ale_haskell_hie_executable = 'hie-wrapper'
" let g:ale_linters = { 'haskell': ['hie', 'hlint'] }
let g:ale_linters = { 'haskell': ['hlint'] }
let g:ale_fixers = { 'haskell': ['brittany', 'hlint'] }
let g:ale_lint_on_text_changed = 'never'

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd <C-]>
nnoremap <silent> gD :ALEGoToDefinitionInVSplit<CR>
nnoremap <silent> <leader>cf :ALEFindReferences<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              LAYOUT & DESIGN                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" === LightLine === "
set noshowmode " remove built in INSERT promt, lightlines takes care of this!

let g:lightline = {
   \ 'colorscheme' : 'challenger_deep',
   \ 'active': {
   \   'left': [ [ 'mode', 'paste' ],
   \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
   \ },
   \ }

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
