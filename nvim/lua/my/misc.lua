-- " === TEX === "
vim.g.tex_flavor = "latex"
-- Runs a script that cleans out tex build files 
-- whenever I close out of a .tex file.
vim.api.nvim_command("autocmd VimLeave *.tex !texclear %")

vim.env.FZF_DEFAULT_OPTS = "--reverse"

  -- " Haskell Parsing (Alex and Happy)
vim.cmd [[au BufRead,BufNewFile *.x set syntax=haskell]]
vim.cmd [[au BufRead,BufNewFile *.y set syntax=haskell]]

-- " === Vim Align === "
vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = false })
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { noremap = false })

-- " === Vim Wordmotion === "
vim.g.wordmotion_prefix = "-"

-- " === Nvim Tree === "
vim.g.nvim_tree_gitignore = 1

-- " === Paredit === "
vim.g.paredit_leader = "æ"
vim.g.paredit_electric_return = 0

-- " === Slime === "
vim.g.slime_target = "tmux"
vim.g.slime_no_mappings = 1

-- " === Rainbow Parenthesis === "
vim.g.rainbow_active = 1

-- " === Snippets === "
vim.g.snips_author = "Eirik Sæther"
vim.g.snips_email = "eirik.halvard.95@gmail.com"
vim.g.snips_github = "https://github.com/eirikhalvard"
-- vim.g.UltiSnipsSnippetsDir = "~/.config/nvim/plugged/vim-snippets/UltiSnips"
-- vim.g.UltiSnipsSnippetDirectories = "~/.config/nvim/plugged/vim-snippets/UltiSnips"

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
