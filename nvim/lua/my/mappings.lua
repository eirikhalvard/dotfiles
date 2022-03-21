local wk = require("which-key")

-- === Leader Key Mappings === --
wk.register({
	name = "🌍 Leader",
	[" "] = { "<cmd>Telescope commands<CR>", "commands" },
	[","] = { "<cmd>e #<CR>", "previous-file" },
	c = { name = "🛠  Compile", a = "async-compile", c = "compile" },
	d = {
		name = "🎮 Do (Action)",
		f = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code-action" },
		h = "insert-haskell-expression",
		i = { "<cmd>luafile ~/.config/nvim/init.lua<CR>", "source-init" },
		s = { "<cmd>syntax sync fromstart<CR>", "sync-syntax" },
	},
	e = {
		name = "💻 Edits",
		f = { "z=1<CR>", "fix-typo" },
		n = "norm-lines",
		N = "norm-non-empty-lines",
		r = "raise-word-to-parenexp",
		s = "substitute",
		S = "substitute-thing",
	},
	f = {
		name = "💿 Files",
		b = { "<cmd>Telescope buffers<CR>", "buffers" },
		c = { "<cmd>Telescope find_files search_dirs=~/.config<CR>", "config-files" },
		f = { "<cmd>Telescope find_files<CR>", "files" },
		F = { "<cmd>Telescope file_browser<CR>", "files" },
		g = {
			name = "🌳 Git",
			b = { "<cmd>Telescope git_branches<CR>", "git-branches" },
			f = { "<cmd>Telescope git_files<CR>", "git-files" },
			j = { "<cmd>Telescope git_stash<CR>", "git-stash" },
			s = { "<cmd>Telescope git_status<CR>", "git-status" },
		},
		H = { "<cmd>tabfirst<CR>", "first-tab" },
		h = { "<cmd>tabprevious<CR>", "previous-tab" },
		J = { "<cmd>blast<CR>", "last-buffer" },
		j = { "<cmd>bnext<CR>", "next-buffer" },
		K = { "<cmd>bfirst<CR>", "first-buffer" },
		k = { "<cmd>bprevious<CR>", "previous-buffer" },
		L = { "<cmd>tablast<CR>", "last-tab" },
		l = { "<cmd>tabnext<CR>", "next-tab" },
		N = { "<cmd>clast<CR>", "last-quickfix" },
		n = { "<cmd>cnext<CR>", "next-quickfix" },
		o = { "<cmd>Telescope oldfiles<CR>", "oldfiles" },
		P = { "<cmd>cfirst<CR>", "first-quickfix" },
		p = { "<cmd>cprevious<CR>", "previous-quickfix" },
		s = { "<cmd>Telescope grep_string<CR>", "search" },
		t = { "<cmd>Telescope<CR>", "telescope" },
		y = { "<cmd>Telescope grep_string<CR>", "yank-and-search" },
		z = { "<cmd>lua require'telescope'.extensions.z.list{}<CR>", "telescope-z" },

	},
	g = {
		name = "🐙 Git",
		b = { "<cmd>Git blame<CR>", "blame" },
		c = { "<cmd>Git commit<CR>", "commit" },
		f = { "<cmd>Git fetch<CR>", "fetch" },
		g = { "<cmd>Git<CR>", "git-menu" },
		h = { "<cmd>!gh repo view -w<CR>", "browse-github" },
		l = { "<cmd>Git pull<CR>", "pull" },
		p = { "<cmd>Git push<CR>", "push" },
		s = { "<cmd>GitGutterStageHunk<CR>", "stage-hunk" },
		w = { "<cmd>Gwrite<CR>", "stage-file" },
	},
	h = {
		name = "🏳️  Help",
		h = { "<cmd>Telescope help_tags<CR>", "help" },
		s = { "<cmd>Telescope spell_suggest<CR>", "spell-suggest" },
		m = { "<cmd>Telescope man_pages<CR>", "man-pages" },
	},
	o = {
		name = "🛹 Open",
		b = { "<cmd>e ~/.config/shell/bash_profile<CR>", "bash-profile" },
		f = "ftplugin-filetype",
		i = { "<cmd>e ~/.config/nvim/init.lua<CR>", "init.vim" },
		-- s = { '<cmd>UltiSnipsEdit<CR>', 'open-snippets' },
	},
	Q = { "<cmd>q!<CR>", "force-quit-file" },
	q = { "<cmd>q<CR>", "quit-file" },
	r = {
		name = "🦀 Resources",
		s = {
			name = "🐸 Slime",
			b = { ",rsmab", "send-bracket" },
			c = { "<Plug>SlimeConfig", "config" },
			m = { "<Plug>SlimeMotionSend", "send-motion" },
			p = { "<Plug>SlimeParagraphSend", "send-paragraph" },
			q = { ",rsmiq", "send-inside-quotes" },
			s = "send",
		},
	},
	s = {
		name = "🚀 LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code-action" },
		e = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "show-line-diagnostics" },
		D = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "type-definitions" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "formatting" },
		i = { "<cmd>TroubleToggle lsp_document_diagnostics<CR>", "trouble-document" },
		j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "goto-next" },
		k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "goto-prev" },
		o = { "<cmd>TroubleToggle lsp_workspace_diagnostics<CR>", "trouble-workspace" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "set-loclist" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
		s = { "<cmd>TroubleToggle<CR>", "trouble-toggle" },
		u = { "<cmd>TroubleToggle quickfix<CR>", "trouble-quickfix" },
		wa = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "add-workspace-folder" },
		wr = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "remove-workspace-folder" },
		wl = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "list-workspace-folders" },
	},
	t = {
		name = "🔘 Toggles",
		g = { "<cmd>Goyo<CR>", "goyo" },
		s = {
			name = "📝 Spell",
			e = { "<cmd>set spelllang=en<CR>", "english" },
			n = { "<cmd>set spelllang=nb<CR>", "norwegian" },
			s = { "<cmd>set spell!<CR>", "toggle-spell" },
		},
		t = { "<cmd>NERDTree<CR>", "tree" },
		w = { "<cmd>set list!<CR>", "whitespace" },
	},
	w = { "<cmd>w<CR>", "write-file" },
}, {
	prefix = "<leader>",
})

-- " Some commands are to complex to be written directly in
-- " the which-key map. Either there is an ex command that
-- " uses more complex features, or we have custom implementation
-- " for visual mode and normal mode
vim.api.nvim_set_keymap("n", "<leader>dh", [[:read !ghead -n -1 < <(ghc -e "")<Left><Left>]], { noremap = false })
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
vim.api.nvim_set_keymap(
	"",
	"<leader>of",
	[[:e ~/.config/nvim/ftplugin/<C-r>=&filetype<CR>.vim<CR>]],
	{ noremap = false }
)
vim.api.nvim_set_keymap("x", "<leader>rss", "<Plug>SlimeRegionSend", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>rss", "<Plug>SlimeParagraphSend", { noremap = false })

-- " === General Mappings === "
vim.api.nvim_set_keymap("i", "fd", "<esc>", { noremap = true })

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
vim.api.nvim_set_keymap("n", "ør", "<leader>fo", { noremap = false })

-- LSP
vim.api.nvim_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>TroubleToggle lsp_references<CR>", { noremap = true })
