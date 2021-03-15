map <buffer> <leader>ap  <Plug>MarkdownPreviewToggle<CR>
map <buffer> <leader>or :e rettemal.md<CR>
map <buffer> <leader>op :w<CR>:silent !open -a Skim %<.pdf<CR>

vmap <buffer> <leader>is dO```scheme<esc>gpO```<esc>
nmap <buffer> <leader>is o```scheme<CR><CR>```<Up>

" markdown syntax often glitches
map <buffer> <leader>w :w<CR>:syntax sync fromstart<CR>:w<CR>
map <buffer> <leader>ag :grep Oppgave %<CR>


"""""""""""""""""""
"  RETTE MAKROER  "
"""""""""""""""""""

" slett helt til neste
let @d ="V/##kkjdkk//Äkb###jj"

" [h]elt riktig på deloppgave
let @h = "?###jjVV/##kkcHelt riktig!jjjjjjjj"

" helt [r]iktig på hel [o]ppgave
let @r = "?^## f(lr2jjV/^## kkcHelt riktig!jjjjjjjj"

" [e]tt poeng på nærmeste poengblokk
let @e = "mm?Xr1'm"

" [p]oeng på nærmeste poengblokk
let @p = "mm?X/llyt)hhvp'm"

" [i]kke gjort (deloppgave)
let @i = "?###jjV/###kkcIkke gjort.jjjj"

" ikke [g]jort (hel oppgave)
let @g = "?^## ff(lr0jjV/^## kkcO€kbIkke gjort.jjjjjjjjj"

" [c]ustom feil
let @c = "?###jjV/Løsningskkc"

" custom feil [u]ten løsningsforslag
let @u = "?###jjV/###kkc"


set foldexpr=NestedMarkdownFolds()

function! MathAndLiquid()
    "" Define certain regions
    " Block math. Look for "$$[anything]$$"
    syn region math start=/\$\$/ end=/\$\$/
    " inline math. Look for "$[not $][anything]$"
    syn match math_block '\$[^$].\{-}\$'

    " Liquid single line. Look for "{%[anything]%}"
    syn match liquid '{%.*%}'
    " Liquid multiline. Look for "{%[anything]%}[anything]{%[anything]%}"
    syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
    " Fenced code blocks, used in GitHub Flavored Markdown (GFM)
    syn region highlight_block start='```' end='```'

    "" Actually highlight those regions.
    hi link math Statement
    hi link liquid Statement
    hi link highlight_block Function
    hi link math_block Function
endfunction

" Call everytime we open a Markdown file
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()
autocmd BufWinEnter * silent! :%foldopen!

