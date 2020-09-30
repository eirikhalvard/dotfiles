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
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  MAPPINGS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


nnoremap <silent> <localleader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual '<Space>'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual ','<CR>
set timeoutlen=500
let g:which_key_map = {}


" === General Mappings === "

map <Left> <C-h>
map <Right> <C-l>
map <Down> }j
map <Up> {k
nnoremap Y y$

" === Top Level Mappings === "

let g:which_key_map = {
\ 'w' : [':w', 'Qrite File'],
\ 'q' : [':q', 'Quit File'],
\ 'Q' : [':q!', 'Force Quit File'],
\ ',' : [':e#', 'Previous File'],
\ ' ' : [':Commands', 'Commands'],
\ }

  let g:which_key_map['t'] = {
  \ 'name' : '🔘 Toggles',
  \ 't' : [':NERDTreeToggle', 'Tree'],
  \ 'g' : [':Goyo', 'Goyo'],
  \ 'w' : [':set list!', 'Whitespace'],
  \ }

    let g:which_key_map['t']['s'] = {
    \ 'name' : '📝 Spell',
    \ 't' : [':set spell!', 'Toggle'],
    \ 'g' : [':set spelllang=nb', 'Norwegian'],
    \ 'w' : [':set spelllang=en', 'English'],
    \ }



call which_key#register(',', "g:which_key_map")

" === Compile (c) === "
map <leader>ca :w! \| AsyncRun compiler "%" <CR>
map <leader>cc :w! \| !compiler "<C-r>%"<CR>
" See completion mappings for more mappings

" === Actions (a) === "
map <leader>ai :source ~/.config/nvim/init.vim<CR>
map <leader>as :syntax sync fromstart<CR>
map <leader>ah :read !ghead -n -1 < <(ghc -e "")<Left><Left>
" map <leader>at :!ctags -R . -- generate tags. defined in ftplugin
" map <leader>ap   -- preview. defined in ftplugin

" === Edit (e) === "
" substitute in buffer or selection
nnoremap <leader>es :%s//g<Left><Left>
vnoremap <leader>es :s/\%V/g<Left><Left>
" substitute selection or word under cursor
nnoremap <leader>eS yiw:%s/\<<C-r>"\>//g<Left><Left>
nnoremap <leader>egS yiw:%s/<C-r>"//g<Left><Left>
vnoremap <leader>eS y:%s/\<<C-r>"\>//g<Left><Left>
vnoremap <leader>egS y:%s/<C-r>"//g<Left><Left>

vnoremap <leader>en :g/.*/norm 
vnoremap <leader>eN :g/..*/norm 

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
map <leader>fc :Files ~/.config<CR>

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
map <leader>ls ]s
map <leader>lS [s

" === Opens (o) === "
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
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr><Left> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr><Right> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" TODO: find suitable mapping. c-space is mapped in system
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" === Completion Mappings === "

" Diagnostics
nmap <silent> <space>dk <Plug>(coc-diagnostics-prev)
nmap <silent> <space>dj <Plug>(coc-diagnostics-next)

" Go
nmap <silent> <space>gd <Plug>(coc-definition)
nmap <silent> <space>gt <Plug>(coc-type-definition)
nmap <silent> <space>gi <Plug>(coc-implementation)
nmap <silent> <space>gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <space>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <space>f  <Plug>(coc-format-selected)
nmap <space>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<space>aap` for current paragraph
xmap <space>a  <Plug>(coc-codeaction-selected)
nmap <space>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <space>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <space>qf  <Plug>(coc-fix-current)

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

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>la  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>le  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>lc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>lo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>ls  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>lj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>lk  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>lp  :<C-u>CocListResume<CR>


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



" \/ \/ OLD COMPLETION SETUP. \/ \/

" === Snippets === "
" let g:UltiSnipsSnippetsDir = '~/.config/nvim/plugged/vim-snippets/UltiSnips'
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips']

"" map <leader>s :Snippets<CR>

" map <leader>os :UltiSnipsEdit<CR>
" map <leader>af :ALEFix<CR>

" let g:ale_linters = { 
" \  'haskell': ['hlint'], 
" \  'tex': ['chktex'] 
" \}

" let g:ale_fixers = { 
" \  'haskell': ['brittany', 'hlint'], 
" \  'tex': ['latexindent'],
" \  'json': ['fixjson'],
" \  'java': ['google_java_format'],
" \  'markdown': ['prettier'],
" \}
" let g:ale_lint_on_text_changed = 'never'

