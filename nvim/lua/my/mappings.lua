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
  c = {
     name = '🛠  Compile',
     a = 'async-compile',
     c = 'compile'
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
    b = { '<cmd>Telescope buffers<CR>', 'buffers' },
    c = { '<cmd>Telescope find_files search_dirs=~/.config<CR>', 'config-files' }, 
    f = { '<cmd>Telescope find_files<CR>', 'files' },
    F = { '<cmd>Telescope file_browser<CR>', 'files' },
    g = { 
      name = '🌳 Git',
      b = { '<cmd>Telescope git_branches<CR>', 'git-branches' },
      f = { '<cmd>Telescope git_files<CR>', 'git-files' },
      j = { '<cmd>Telescope git_stash<CR>', 'git-stash' },
      s = { '<cmd>Telescope git_status<CR>', 'git-status' },
    },
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
    o = { '<cmd>Telescope oldfiles<CR>', 'oldfiles' },
    P = { '<cmd>cfirst<CR>', 'first-quickfix' },
    p = { '<cmd>cprevious<CR>', 'previous-quickfix' },
    s = { '<cmd>Telescope grep_string<CR>', 'search' },
    t = { '<cmd>Telescope<CR>', 'telescope' },
    y = { '<cmd>Telescope grep_string<CR>', 'yank-and-search' },
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
     h = { '<cmd>Telescope help_tags<CR>', 'help' },
     s = { '<cmd>Telescope spell_suggest<CR>', 'spell-suggest' },
     m = { '<cmd>Telescope man_pages<CR>', 'man-pages' },
     },
 l = {
     name = '🚀 LSP',
     -- a = { '<Plug>(coc-codeaction-selected)', 'codeaction' },
     -- af = { '<Plug>(coc-codeaction)', 'codeaction-file' },
     -- C = { '<cmd>Fold<CR>', 'fold-close' },
     -- d = { '<Plug>(coc-diagnostic-next)', 'diagnostic-next' },
     -- D = { '<Plug>(coc-diagnostic-prev)', 'diagnostic-prev' },
     -- e = { '<Plug>(coc-codelens-action)', 'eval-codelens-action' },
     -- F = { '<cmd>Format<CR>', 'format' },
     -- f = { '<Plug>(coc-format-selected)', 'format-selected' },
     -- g = {
     --   name = '🏂 Go',
     --   d = { '<Plug>(coc-definition)', 'definition' },
     --   i = { '<Plug>(coc-implementation)', 'implementation' },
     --   r = { '<Plug>(coc-references)', 'references' },
     --   t = { '<Plug>(coc-type-definition)', 'type-definition' },
     --   },
     -- l = { '<cmd>CocList<CR>', 'coc-list' },
     -- O = { '<cmd>OR<CR>', 'organize-imports' },
     -- q = { '<Plug>(coc-fix-current)', 'fix-current' },
     -- R = { '<Plug>(coc-restart)', 'coc-restart' },
     -- r = { '<Plug>(coc-rename)', 'rename' },
     -- s = { 'K', 'show-documentation (K)' },
     },
 o = {
     name = '🛹 Open',
     b = { '<cmd>e ~/.config/shell/bash_profile<CR>', 'bash-profile' },
     -- c = { '<cmd>CocConfig<CR>', 'coc-config' },
     f = 'ftplugin-filetype',
     i = { '<cmd>e ~/.config/nvim/init.lua<CR>', 'init.vim' },
     -- s = { '<cmd>UltiSnipsEdit<CR>', 'open-snippets' },
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
 -- S = { '<cmd>CocList snippets<CR>', 'insert-snippet' },
 t = {
     name = '🔘 Toggles',
     -- e = { '<cmd>CocCommand explorer<CR>', 'explorer' },
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

-- replace termcodes. used to escape certain mapping encodings
local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- " Some commands are to complex to be written directly in
-- " the which-key map. Either there is an ex command that
-- " uses more complex features, or we have custom implementation
-- " for visual mode and normal mode
vim.api.nvim_set_keymap("n", "<leader>ah", [[:read !ghead -n -1 < <(ghc -e "")<Left><Left>]], { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>ca", [[:w! | AsyncRun compiler "%"<CR>]], { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>cc", [[:w! | !compiler "<C-r>%"<CR>]], { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>er", "diwvabp", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>er", "dvabp", { noremap = true })
vim.api.nvim_set_keymap("", "<leader>en", ":g/.*/norm ", { noremap = false })
vim.api.nvim_set_keymap("", "<leader>eN", ":g/..*/norm ", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>es", ":%s//g<Left><Left>", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>es", [[:s/\%V/g<Left><Left>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>eS", [[yiw:%s/\<<C-r>"\>//g<Left><Left>]], { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>eS", [[y:%s/\<<C-r>"\>//g<Left><Left>]], { noremap = true })
vim.api.nvim_set_keymap("", "<leader>of", [[:e ~/.config/nvim/ftplugin/<C-r>=&filetype<CR>.vim<CR>]], { noremap = false })
vim.api.nvim_set_keymap("x", "<leader>rss", "<Plug>SlimeRegionSend", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>rss", "<Plug>SlimeParagraphSend", { noremap = false })

-- " === General Mappings === "

-- Move up/down editor lines
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "gj", "j", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
vim.api.nvim_set_keymap("n", "gk", "k", { noremap = true })

-- Y behaves the same was as D, C, etc
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

-- Use arrow keys to navigate files / tmux panes
vim.api.nvim_set_keymap("", "<Left>", "<C-h>", { noremap = false })
vim.api.nvim_set_keymap("", "<Right>", "<C-l>", { noremap = false })
vim.api.nvim_set_keymap("", "<Down>", "}j", { noremap = false })
vim.api.nvim_set_keymap("", "<Up>", "{k", { noremap = false })

vim.api.nvim_set_keymap("n", "øf", "<leader>ff", { noremap = false })
vim.api.nvim_set_keymap("n", "øs", "<leader>fs", { noremap = false })
-- vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { noremap = false })
