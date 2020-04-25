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
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" === Completion === "
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fszymanski/deoplete-emoji'
Plug 'Shougo/neco-syntax'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" === Filetype specific === "
Plug 'masukomi/vim-markdown-folding'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'neovimhaskell/haskell-vim'

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

" === Snippets === "
let g:UltiSnipsSnippetsDir = '~/.config/nvim/plugged/vim-snippets/UltiSnips'
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips']


" === Rainbow === "
let g:rainbow_active = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  MAPPINGS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" === General Mappings === "
map <Left> <C-h>
map <Right> <C-l>
map <Down> }j
map <Up> {k
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
nnoremap Y y$

" === Leader mappings === "
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>Q :q!<CR>
map <leader><space> :Commands<CR>
map <leader>s :Snippets<CR>
map <silent> <leader><leader> :e#<CR>

" === Toggles (t) === "
map <leader>ta  :ALEToggle<CR>
map <leader>tss :set spell!<CR>
map <leader>tsn :set spelllang=nb<CR>
map <leader>tse :set spelllang=en<CR>
map <leader>tt :NERDTreeToggle<CR>
map <leader>tg :Goyo<CR>
map <leader>tl :set list!<CR>

" === Compile (c) === "
map <leader>ca :w! \| AsyncRun compiler "%" <CR>
map <leader>cc :w! \| !compiler <C-r>%<CR>

" === Actions (a) === "
map <leader>ai :source ~/.config/nvim/init.vim<CR>
map <leader>as :syntax sync fromstart<CR>
map <leader>af :ALEFix<CR>
map <leader>ah :read !ghead -n -1 < <(ghc -e "")<Left><Left>
" map <leader>at :!ctags -R . -- generate tags. defined in ftplugin
" map <leader>ap   -- preview. defined in ftplugin


" === Edit (e) === "
" substitute in buffer or selection
nnoremap <leader>es :%s//g<Left><Left>
vnoremap <leader>es :%s/\%V/g<Left><Left>
" substitute selection or word under cursor
nnoremap <leader>eS yiw:%s/\<<C-r>"\>//g<Left><Left>
nnoremap <leader>egS yiw:%s/<C-r>"//g<Left><Left>
vnoremap <leader>eS y:%s/\<<C-r>"\>//g<Left><Left>
vnoremap <leader>egS y:%s/<C-r>"//g<Left><Left>

" === File navigation (f) === "
map <leader>ff :Files<CR>
map <leader>fg :GFiles<CR>
map <leader>fb :Buffers<CR>
map <leader>fK :bfirst<CR>
map <leader>fk :bprevious<CR>
map <leader>fj :bnext<CR>
map <leader>fJ :blast<CR>
map <leader>fH :tabfirst<CR>
map <leader>fh :tabprevious<CR>
map <leader>fl :tabnext<CR>
map <leader>fL :tablast<CR>
map <leader>fP :cfirst<CR>
map <leader>fp :cprevious<CR>
map <leader>fn :cnext<CR>
map <leader>fN :clast<CR>
map <leader>fc :cwindow<CR>

" === Git (g) === "
map <leader>gb :Git blame<CR>
map <leader>gc :Git commit<CR>
map <leader>gf :Git fetch<CR>
map <leader>gl :Git pull<CR>
map <leader>gg :Git<CR>
map <leader>gh :GBrowse<CR>
map <leader>gp :Git push<CR>
map <leader>gw :Gwrite<CR>

" === Locate (l) === "
map <leader>la :ALENextWrap<CR>
map <leader>lA :ALEPreviousWrap<CR>
map <leader>ls ]s
map <leader>lS [s

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
" Use ALE and also some plugin 'foobar' as completion sources for all code.
" call deoplete#custom#option('sources', {
" \ '_': ['buffer', 'emoji'],
" \})

" use built in emojis
call deoplete#custom#source('emoji', 'converters', ['converter_emoji'])

" === ALE === "
hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap

let g:ale_enabled = 0
let g:ale_sign_column_always = 1   "keep gutter open
let g:ale_haskell_hie_executable = 'hie-wrapper'
let g:ale_linters = { 
\  'haskell': ['hlint'], 
\  'tex': ['chktex'] 
\}

let g:ale_fixers = { 
\  'haskell': ['brittany', 'hlint'], 
\  'tex': ['latexindent'],
\  'json': ['fixjson'],
\  'java': ['google_java_format']
\}
let g:ale_lint_on_text_changed = 'never'

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
   \ 'colorscheme' : 'one',
   \ 'active': {
   \   'left': [ [ 'mode', 'paste' ],
   \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
   \ },
   \ 'component_function': {
   \   'gitbranch': 'FugitiveHead'
   \ },
   \ }

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
