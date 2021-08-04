vim.g.builtin_lsp = true

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

-- " === Ale === "
vim.api.nvim_set_var("ale_fix_on_save", 1)
vim.g.ale_linters_explicit = 1
vim.g.ale_fixerss = { haskell =  { "fourmolu" }  }
-- old linters:
-- " \  'tex': ['latexindent'],
-- " \  'json': ['fixjson'],
-- " \  'java': ['google_java_format'],
-- " \  'markdown': ['prettier'],
-- "
-- let g:ale_lint_on_text_changed = 'never'

vim.cmd([[
function! FormatHaskell(buffer) abort
    return {
    \   'command': 'fourmolu --indentation 2 --indent-wheres true'
    \}
endfunction
execute ale#fix#registry#Add('fourmolu', 'FormatHaskell', ['haskell'], 'fourmolu for haskell')
]])

