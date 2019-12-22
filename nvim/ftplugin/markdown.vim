" ABBREVIATIONS
" iabbrev -> $\rightarrow$
map <leader>ap  <Plug>MarkdownPreviewToggle<CR>

" IN2040 rette-makroer
let @c ="V/##kkcqj€kbkjq"
let @d ="V/##kkjdkk//€kb###jj"
let @h ="@ciHelt riktig!  kk/###jj"
let @g ="wwyWbbvehhp/###wwww"



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


