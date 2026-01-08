local wk = require("which-key")

wk.setup({
  icons = { mappings = false },
})

wk.add({
  { "<leader>", group = "🌍 Leader" },

  { "<leader><space>", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<leader>,", "<cmd>e #<cr>", desc = "Previous file" },

  { "<leader>c", group = "🛠 Compile" },
  { "<leader>ca", desc = "Async compile" },
  { "<leader>cc", desc = "Compile" },

  { "<leader>d", group = "🎮 Do" },
  { "<leader>df", vim.lsp.buf.code_action, desc = "Code action" },
  { "<leader>di", "<cmd>luafile ~/.config/nvim/init.lua<cr>", desc = "Source init" },
  { "<leader>ds", "<cmd>syntax sync fromstart<cr>", desc = "Sync syntax" },

  { "<leader>e", group = "💻 Edits" },
  { "<leader>ef", "z=1", desc = "Fix typo" },
  { "<leader>es", desc = "Substitute" },
  { "<leader>eS", desc = "Substitute word" },

  { "<leader>f", group = "💿 Files" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
  { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old files" },
  { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Search" },
  { "<leader>fz", "<cmd>Telescope z<cr>", desc = "Z" },

  { "<leader>g", group = "🐙 Git" },
  { "<leader>gg", "<cmd>Git<cr>", desc = "Git status" },
  { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame" },
  { "<leader>gp", "<cmd>Git push<cr>", desc = "Push" },

  { "<leader>h", group = "🏳️ Help" },
  { "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },

  { "<leader>o", group = "🛹 Open" },
  {
    "<leader>of",
    function()
      vim.cmd("e ~/.config/nvim/ftplugin/" .. vim.bo.filetype .. ".vim")
    end,
    desc = "ftplugin file",
  },

  { "<leader>s", group = "🚀 LSP" },
  { "<leader>sa", vim.lsp.buf.code_action, desc = "Code action" },
  { "<leader>sr", vim.lsp.buf.rename, desc = "Rename" },
  { "<leader>sf", function() vim.lsp.buf.format({ async = true }) end, desc = "Format" },
  { "<leader>ss", "<cmd>TroubleToggle<cr>", desc = "Trouble" },

  { "<leader>t", group = "🔘 Toggles" },
  { "<leader>tg", "<cmd>Goyo<cr>", desc = "Goyo" },
  { "<leader>tw", "<cmd>set list!<cr>", desc = "Whitespace" },

  { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
  { "<leader>Q", "<cmd>q!<cr>", desc = "Force quit" },
})

vim.keymap.set("n", "<leader>dh",
  [[:read !ghead -n -1 < <(ghc -e "")<Left><Left>]],
  { desc = "Insert Haskell expr" }
)

vim.keymap.set("n", "<leader>ca",
  ":w! | AsyncRun compiler \"%\"<cr>",
  { desc = "Async compile" }
)

vim.keymap.set("n", "<leader>cc",
  ":w! | !compiler \"%\"<cr>",
  { desc = "Compile" }
)

vim.keymap.set({ "n", "v" }, "<leader>er", "dvabp", { desc = "Raise word" })

vim.keymap.set("x", "<leader>rss", "<Plug>SlimeRegionSend", { desc = "Slime region" })
vim.keymap.set("n", "<leader>rss", "<Plug>SlimeParagraphSend", { desc = "Slime paragraph" })

-- Better movement
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "gj", "j")
vim.keymap.set("n", "gk", "k")

-- Yank to end of line
vim.keymap.set("n", "Y", "y$")

-- Arrow keys → tmux / splits
vim.keymap.set("", "<Left>", "<C-h>")
vim.keymap.set("", "<Right>", "<C-l>")
vim.keymap.set("", "<Up>", "{k")
vim.keymap.set("", "<Down>", "}j")

-- CMD-S (iTerm)
vim.keymap.set({ "n", "i" }, "<F10>", "<cmd>w<cr>", { desc = "Save" })

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })
vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", { desc = "References" })
