map <buffer> <leader>ap :silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %<.pdf<CR>
map <buffer> <leader>ft :VimtexTocOpen<CR>
map <buffer> øt :call vimtex#fzf#run('c')<CR>
map <buffer> øT :call vimtex#fzf#run()<CR>
map <buffer> øp :VimtexView<CR>

autocmd BufWinEnter * silent! :%foldopen!

set spell
