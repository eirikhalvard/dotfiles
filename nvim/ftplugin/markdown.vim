map <buffer> <leader>ap  <Plug>MarkdownPreviewToggle<CR>
map <buffer> <leader>or :e rettermal.md<CR>
map <buffer> <leader>op :w<CR>:silent !open -a Skim %<.pdf<CR>

vmap <buffer> <leader>is dO```scheme<esc>gpO```<esc>
nmap <buffer> <leader>is o```scheme<CR><CR>```<Up>

" markdown syntax often glitches
map <buffer> <leader>w :w<CR>:syntax sync fromstart<CR>:w<CR>


" rette-makroer
let @c ="V/##kkcqj€kbkjq"
let @d ="V/##kkjdkk//€kb###jj"
let @h ="@ciHelt riktig!  kk/###jj"
let @g ="wwyWbbvehhp/###wwww"
let @p ="$bvBohhybbvpjj"
let @r ="kk@p@h"

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

