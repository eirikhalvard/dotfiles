local M = {}

M.setup = function()
  vim.cmd("highlight clear")
  vim.o.background = "dark"
  vim.o.termguicolors = true

  local colors = {
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

  local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Core UI
  hl("Normal",       { fg = colors.fg, bg = colors.bg })
  hl("Cursor",       { fg = colors.cursor_text, bg = colors.cursor })
  hl("CursorLine",   { bg = "#2a2a2a" })
  hl("LineNr",       { fg = colors.gray })
  hl("CursorLineNr", { fg = colors.yellow, bold = true })
  hl("Visual",       { bg = colors.selection_bg })
  hl("Search",       { fg = colors.selection_fg, bg = colors.selection_bg })
  hl("IncSearch",    { fg = colors.selection_fg, bg = colors.selection_bg })
  hl("MatchParen",   { bg = colors.blue, bold = true })
  hl("VertSplit",    { fg = colors.gray })
  hl("StatusLine",   { fg = colors.fg, bg = colors.gray })
  hl("StatusLineNC", { fg = colors.gray, bg = colors.bg })

  -- Popup menus
  hl("Pmenu",        { fg = colors.fg, bg = colors.bg })
  hl("PmenuSel",     { fg = colors.bg, bg = colors.bright_blue })
  hl("PmenuSbar",    { bg = colors.gray })
  hl("PmenuThumb",   { bg = colors.blue })

  -- Syntax
  hl("Comment",      { fg = "#6272a4", italic = true })
  hl("Constant",     { fg = colors.cyan })
  hl("String",       { fg = colors.green })
  hl("Character",    { fg = colors.yellow })
  hl("Number",       { fg = colors.magenta })
  hl("Boolean",      { fg = colors.red })
  hl("Float",        { fg = colors.magenta })
  hl("Identifier",   { fg = colors.blue })
  hl("Function",     { fg = colors.bright_blue })
  hl("Statement",    { fg = colors.red })
  hl("Keyword",      { fg = colors.magenta })
  hl("Error",        { fg = colors.bright_red, bold = true })
  hl("Todo",         { fg = colors.bright_yellow, bg = "#44475a", bold = true })

  -- Tree-sitter
  hl("@comment",             { fg = "#6272a4", italic = true })
  hl("@constant",            { fg = colors.cyan })
  hl("@constant.builtin",    { fg = colors.magenta })
  hl("@constant.macro",      { fg = colors.bright_magenta })
  hl("@string",              { fg = colors.green })
  hl("@string.escape",       { fg = colors.yellow })
  hl("@character",           { fg = colors.yellow })
  hl("@number",              { fg = colors.magenta })
  hl("@boolean",             { fg = colors.red })
  hl("@float",               { fg = colors.magenta })
  hl("@function",            { fg = colors.bright_blue })
  hl("@function.call",       { fg = colors.bright_blue })
  hl("@function.macro",      { fg = colors.yellow })
  hl("@parameter",           { fg = colors.fg })
  hl("@keyword",             { fg = colors.magenta })
  hl("@keyword.function",    { fg = colors.magenta })
  hl("@keyword.operator",    { fg = colors.red })
  hl("@operator",            { fg = colors.fg })
  hl("@type",                { fg = colors.bright_magenta })
  hl("@type.builtin",        { fg = colors.magenta })
  hl("@variable",            { fg = colors.fg })
  hl("@variable.builtin",    { fg = colors.yellow })
  hl("@property",            { fg = colors.fg })
  hl("@punctuation",         { fg = colors.fg })
  hl("@punctuation.bracket", { fg = colors.gray })
  hl("@tag",                 { fg = colors.red })
  hl("@tag.attribute",       { fg = colors.yellow })
  hl("@field",               { fg = colors.blue })
  hl("@method",              { fg = colors.bright_blue })
  hl("@constructor",         { fg = colors.bright_blue })
  hl("@namespace",           { fg = colors.cyan })
  hl("@label",               { fg = colors.yellow })
  hl("@repeat",              { fg = colors.red })
  hl("@conditional",         { fg = colors.red })
  hl("@include",             { fg = colors.yellow })
  hl("@exception",           { fg = colors.bright_red })
  hl("@preproc",             { fg = colors.yellow })
  hl("@macro",               { fg = colors.yellow })
  hl("@storageclass",        { fg = colors.bright_magenta })
end

-- Apply the theme
M.setup()

return M
