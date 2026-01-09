local M = {}

M.colors = {
  bg             = "#332a57",  -- background
  fg             = "#e5e5e5",  -- foreground
  gray           = "#595959",  -- palette 8
  red            = "#ff7092",  -- palette 1
  green          = "#00fbac",  -- palette 2
  yellow         = "#fffa6a",  -- palette 3
  blue           = "#00bfff",  -- palette 4
  magenta        = "#df95ff",  -- palette 5
  cyan           = "#86cbfe",  -- palette 6
  white          = "#ffffff",  -- palette 7
  bright_red     = "#ff8aa4",  -- palette 9
  bright_green   = "#21f6bc",  -- palette 10
  bright_yellow  = "#fff787",  -- palette 11
  bright_blue    = "#1bccfd",  -- palette 12
  bright_magenta = "#e6aefe",  -- palette 13
  bright_cyan    = "#99d6fc",  -- palette 14
  bright_white   = "#ffffff",  -- palette 15
  cursor         = "#21f6bc",
  cursor_text    = "#999999",
  selection_bg   = "#c1deff",
  selection_fg   = "#000000",
}

M.setup = function()
  vim.cmd("highlight clear")
  vim.o.background = "dark"
  vim.o.termguicolors = true

  local c = M.colors

  local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Core UI
  hl("Normal",       { fg = c.fg, bg = c.bg })
  hl("Cursor",       { fg = c.cursor_text, bg = c.cursor })
  hl("CursorLine",   { bg = "#2a2a2a" })
  hl("LineNr",       { fg = c.gray })
  hl("CursorLineNr", { fg = c.yellow, bold = true })
  hl("Visual",       { bg = c.selection_bg })
  hl("Search",       { fg = c.selection_fg, bg = c.selection_bg })
  hl("IncSearch",    { fg = c.selection_fg, bg = c.selection_bg })
  hl("MatchParen",   { bg = c.blue, bold = true })
  hl("VertSplit",    { fg = c.gray })
  hl("StatusLine",   { fg = c.fg, bg = c.gray })
  hl("StatusLineNC", { fg = c.gray, bg = c.bg })

  -- Popup menus
  hl("Pmenu",        { fg = c.fg, bg = c.bg })
  hl("PmenuSel",     { fg = c.bg, bg = c.bright_blue })
  hl("PmenuSbar",    { bg = c.gray })
  hl("PmenuThumb",   { bg = c.blue })

  -- Syntax
  hl("Comment",      { fg = "#6272a4", italic = true })
  hl("Constant",     { fg = c.cyan })
  hl("String",       { fg = c.green })
  hl("Character",    { fg = c.yellow })
  hl("Number",       { fg = c.magenta })
  hl("Boolean",      { fg = c.red })
  hl("Float",        { fg = c.magenta })
  hl("Identifier",   { fg = c.blue })
  hl("Function",     { fg = c.bright_blue })
  hl("Statement",    { fg = c.red })
  hl("Keyword",      { fg = c.magenta })
  hl("Error",        { fg = c.bright_red, bold = true })
  hl("Todo",         { fg = c.bright_yellow, bg = "#44475a", bold = true })

  -- Tree-sitter
  hl("@comment",             { fg = "#6272a4", italic = true })
  hl("@constant",            { fg = c.cyan })
  hl("@constant.builtin",    { fg = c.magenta })
  hl("@constant.macro",      { fg = c.bright_magenta })
  hl("@string",              { fg = c.green })
  hl("@string.escape",       { fg = c.yellow })
  hl("@character",           { fg = c.yellow })
  hl("@number",              { fg = c.magenta })
  hl("@boolean",             { fg = c.red })
  hl("@float",               { fg = c.magenta })
  hl("@function",            { fg = c.bright_blue })
  hl("@function.call",       { fg = c.bright_blue })
  hl("@function.macro",      { fg = c.yellow })
  hl("@parameter",           { fg = c.fg })
  hl("@keyword",             { fg = c.magenta })
  hl("@keyword.function",    { fg = c.magenta })
  hl("@keyword.operator",    { fg = c.red })
  hl("@operator",            { fg = c.fg })
  hl("@type",                { fg = c.bright_magenta })
  hl("@type.builtin",        { fg = c.magenta })
  hl("@variable",            { fg = c.fg })
  hl("@variable.builtin",    { fg = c.yellow })
  hl("@property",            { fg = c.fg })
  hl("@punctuation",         { fg = c.fg })
  hl("@punctuation.bracket", { fg = c.gray })
  hl("@tag",                 { fg = c.red })
  hl("@tag.attribute",       { fg = c.yellow })
  hl("@field",               { fg = c.blue })
  hl("@method",              { fg = c.bright_blue })
  hl("@constructor",         { fg = c.bright_blue })
  hl("@namespace",           { fg = c.cyan })
  hl("@label",               { fg = c.yellow })
  hl("@repeat",              { fg = c.red })
  hl("@conditional",         { fg = c.red })
  hl("@include",             { fg = c.yellow })
  hl("@exception",           { fg = c.bright_red })
  hl("@preproc",             { fg = c.yellow })
  hl("@macro",               { fg = c.yellow })
  hl("@storageclass",        { fg = c.bright_magenta })
end

-- Apply the theme
M.setup()

return M
