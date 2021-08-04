
-- -- Move up/down editor lines
-- noremap j gj
-- noremap gj j
-- noremap k gk
-- noremap gk k

local wk = require("which-key")

-- === Leader Key Mappings === --
wk.register({
  name = '🌍 Leader',
  [" "] = { '<cmd>Commands<CR>', 'commands' },
  [","] = { '<cmd>e #<CR>', 'previous-file' },
  a = {
    name = "🎮 Actions",
    f = { "<cmd>ALEFix<CR>", "ale-fix" },
    h = 'insert-haskell-expression',
    i = { "<cmd>luafile ~/.config/nvim/init.lua<CR>", "source-init" },
    s = { "<cmd>syntax sync fromstart<CR>", "sync-syntax" },
    -- y = {':CocList -A --normal yank', 'yank-list'},
  },
  f = {
    name = '💿 Files',
    b = { '<cmd>Buffers<CR>', 'buffers' },
    c = { '<cmd>Files ~/.config<CR>', 'config-files' },
    f = { '<cmd>Files<CR>', 'files' },
    g = { '<cmd>GFiles<CR>', 'git-files' },
    H = { '<cmd>tabfirst<CR>', 'first-tab' },
    h = { '<cmd>tabprevious<CR>', 'previous-tab' },
    J = { '<cmd>blast<CR>', 'last-buffer' },
    j = { '<cmd>bnext<CR>', 'next-buffer' },
    K = { '<cmd>bfirst<CR>', 'first-buffer' },
    k = { '<cmd>bprevious<CR>', 'previous-buffer' },
    L = { '<cmd>tablast<CR>', 'last-tab' },
    l = { '<cmd>tabnext<CR>', 'next-tab' },
    N = { '<cmd>clast<CR>', 'last-quickfix' },
    n = { '<cmd>cnext<CR>', 'next-quickfix' },
    P = { '<cmd>cfirst<CR>', 'first-quickfix' },
    p = { '<cmd>cprevious<CR>', 'previous-quickfix' },
    },
  c = {
     name = '🛠  Compile',
     a = 'async-compile',
     c = 'compile',
     },
 e = {
     name = '💻 Edits',
     f = { 'z=1<CR>', 'fix-typo' },
     n = 'norm-lines',
     N = 'norm-non-empty-lines',
     r = 'raise-word-to-parenexp',
     s = 'substitute',
     S = 'substitute-thing',
     },
 f = {
     name = '💿 Files',
     b = { '<cmd>Buffers<CR>', 'buffers' },
     c = { '<cmd>Files ~/.config<CR>', 'config-files' },
     f = { '<cmd>Files<CR>', 'files' },
     g = { '<cmd>GFiles<CR>', 'git-files' },
     H = { '<cmd>tabfirst<CR>', 'first-tab' },
     h = { '<cmd>tabprevious<CR>', 'previous-tab' },
     J = { '<cmd>blast<CR>', 'last-buffer' },
     j = { '<cmd>bnext<CR>', 'next-buffer' },
     K = { '<cmd>bfirst<CR>', 'first-buffer' },
     k = { '<cmd>bprevious<CR>', 'previous-buffer' },
     L = { '<cmd>tablast<CR>', 'last-tab' },
     l = { '<cmd>tabnext<CR>', 'next-tab' },
     N = { '<cmd>clast<CR>', 'last-quickfix' },
     n = { '<cmd>cnext<CR>', 'next-quickfix' },
     P = { '<cmd>cfirst<CR>', 'first-quickfix' },
     p = { '<cmd>cprevious<CR>', 'previous-quickfix' },
     },
 g = {
     name = '🐙 Git',
     b = { '<cmd>Git blame<CR>', 'blame' },
     c = { '<cmd>Git commit<CR>', 'commit' },
     f = { '<cmd>Git fetch<CR>', 'fetch' },
     g = { '<cmd>Git<CR>', 'git-menu' },
     h = { '<cmd>GBrowse<CR>', 'browse-github' },
     l = { '<cmd>Git pull<CR>', 'pull' },
     p = { '<cmd>Git push<CR>', 'push' },
     w = { '<cmd>Gwrite<CR>', 'stage-file' },
     },
 h = {
     name = '🏳️  Help',
     h = { '<cmd>Helptags<CR>', 'help' },
     m = { '<cmd>Maps<CR>', 'mappings' },
     },
 l = {
     name = '🚀 LSP',
     a = { '<Plug>(coc-codeaction-selected)', 'codeaction' },
     af = { '<Plug>(coc-codeaction)', 'codeaction-file' },
     C = { '<cmd>Fold<CR>', 'fold-close' },
     d = { '<Plug>(coc-diagnostic-next)', 'diagnostic-next' },
     D = { '<Plug>(coc-diagnostic-prev)', 'diagnostic-prev' },
     e = { '<Plug>(coc-codelens-action)', 'eval-codelens-action' },
     F = { '<cmd>Format<CR>', 'format' },
     f = { '<Plug>(coc-format-selected)', 'format-selected' },
     g = {
       name = '🏂 Go',
       d = { '<Plug>(coc-definition)', 'definition' },
       i = { '<Plug>(coc-implementation)', 'implementation' },
       r = { '<Plug>(coc-references)', 'references' },
       t = { '<Plug>(coc-type-definition)', 'type-definition' },
       },
     l = { '<cmd>CocList<CR>', 'coc-list' },
     O = { '<cmd>OR<CR>', 'organize-imports' },
     q = { '<Plug>(coc-fix-current)', 'fix-current' },
     R = { '<Plug>(coc-restart)', 'coc-restart' },
     r = { '<Plug>(coc-rename)', 'rename' },
     s = { 'K', 'show-documentation (K)' },
     },
 o = {
     name = '🛹 Open',
     b = { '<cmd>e ~/.config/shell/bash_profile<CR>', 'bash-profile' },
     c = { '<cmd>CocConfig<CR>', 'coc-config' },
     f = 'ftplugin-filetype',
     i = { '<cmd>e ~/.config/nvim/init.lua<CR>', 'init.vim' },
     s = { '<cmd>UltiSnipsEdit<CR>', 'open-snippets' },
     },
 Q = { '<cmd>q!<CR>', 'force-quit-file' },
 q = { '<cmd>q<CR>', 'quit-file' },
 r = {
     name = '🦀 Resources',
     s = {
       name = '🐸 Slime',
       b = { ',rsmab', 'send-bracket' },
       c = { '<Plug>SlimeConfig', 'config' },
       m = { '<Plug>SlimeMotionSend', 'send-motion' },
       p = { '<Plug>SlimeParagraphSend', 'send-paragraph' },
       q = { ',rsmiq', 'send-inside-quotes' },
       s = 'send',
       },
     },
 S = { '<cmd>CocList snippets<CR>', 'insert-snippet' },
 t = {
     name = '🔘 Toggles',
     e = { '<cmd>CocCommand explorer<CR>', 'explorer' },
     g = { '<cmd>Goyo<CR>', 'goyo' },
     s = {
         name = '📝 Spell',
         e = { '<cmd>set spelllang=en<CR>', 'english' },
         n = { '<cmd>set spelllang=nb<CR>', 'norwegian' },
         s = { '<cmd>set spell!<CR>', 'toggle-spell' },
         },
     t = { '<cmd>NvimTreeToggle<CR>', 'tree' },
     w = { '<cmd>set list!<CR>', 'whitespace' },
     },
 w = { '<cmd>w<CR>', 'write-file' },
}, { prefix = "<leader>" })


-- " === General Mappings === "

-- map <Left> <C-h>
-- map <Right> <C-l>
-- map <Down> }j
-- map <Up> {k
-- nnoremap Y y$


-- " Some commands are to complex to be written directly in
-- " the which-key map. Either there is an ex command that
-- " uses more complex features, or we have custom implementation
-- " for visual mode and normal mode
-- map <leader>ah :read !ghead -n -1 < <(ghc -e "")<Left><Left>
-- map <leader>ca :w! \| AsyncRun compiler "%" <CR>
-- map <leader>cc :w! \| !compiler "<C-r>%"<CR>
-- nnoremap <leader>er diwvabp
-- vnoremap <leader>er dvabp
-- map <leader>en :g/.*/norm 
-- map <leader>eN :g/..*/norm 
-- nnoremap <leader>es :%s//g<Left><Left>
-- vnoremap <leader>es :s/\%V/g<Left><Left>
-- nnoremap <leader>eS yiw:%s/\<<C-r>"\>//g<Left><Left>
-- vnoremap <leader>eS y:%s/\<<C-r>"\>//g<Left><Left>
-- map <leader>of :e ~/.config/nvim/ftplugin/<C-r>=&filetype<CR>.vim<CR>
-- xmap <leader>rss <Plug>SlimeRegionSend
-- nmap <leader>rss <Plug>SlimeParagraphSend

-- nmap øf :Files<CR>
-- nmap ør :Rg<CR>
-- nmap gd <Plug>(coc-definition)


-- " Formatting selected code.
-- " " Mappings for CoCList
-- " " Show all diagnostics.
-- " nnoremap <silent><nowait> <space>la  :<C-u>CocList diagnostics<cr>
-- " " Manage extensions.
-- " nnoremap <silent><nowait> <space>le  :<C-u>CocList extensions<cr>
-- " " Show commands.
-- " nnoremap <silent><nowait> <space>lc  :<C-u>CocList commands<cr>
-- " " Find symbol of current document.
-- " nnoremap <silent><nowait> <space>lo  :<C-u>CocList outline<cr>
-- " " Search workspace symbols.
-- " nnoremap <silent><nowait> <space>ls  :<C-u>CocList -I symbols<cr>
-- " " Do default action for next item.
-- " nnoremap <silent><nowait> <space>lj  :<C-u>CocNext<CR>
-- " " Do default action for previous item.
-- " nnoremap <silent><nowait> <space>lk  :<C-u>CocPrev<CR>
-- " " Resume latest coc list.
-- " nnoremap <silent><nowait> <space>lp  :<C-u>CocListResume<CR>


-- call which_key#register(',', "g:which_key_map")
