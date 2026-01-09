local M = {}

M.colors = {
  bg             = "#fffcf0",  -- background
  fg             = "#100f0f",  -- foreground
  gray           = "#b7b5ac",  -- palette 8
  red            = "#af3029",  -- palette 1
  green          = "#66800b",  -- palette 2
  yellow         = "#ad8301",  -- palette 3
  blue           = "#205ea6",  -- palette 4
  magenta        = "#a02f6f",  -- palette 5
  cyan           = "#24837b",  -- palette 6
  white          = "#6f6e69",  -- palette 7
  bright_red     = "#d14d41",  -- palette 9
  bright_green   = "#879a39",  -- palette 10
  bright_yellow  = "#d0a215",  -- palette 11
  bright_blue    = "#4385be",  -- palette 12
  bright_magenta = "#ce5d97",  -- palette 13
  bright_cyan    = "#3aa99f",  -- palette 14
  bright_white   = "#cecdc3",  -- palette 15
  cursor         = "#100f0f",  -- cursor-color
  cursor_text    = "#fffcf0",  -- cursor text
  selection_bg   = "#cecdc3",  -- selection-background
  selection_fg   = "#100f0f",  -- selection-foreground
}

M.setup = function()
  vim.cmd("highlight clear")
  vim.o.background = "light"
  vim.o.termguicolors = true

  local c = M.colors

  local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Core UI
  hl("Normal",       { fg = c.fg, bg = c.bg })
  hl("Cursor",       { fg = c.cursor_text, bg = c.cursor })
  hl("CursorLine",   { bg = "#f0f0e0" })  -- slightly lighter than bg
  hl("LineNr",       { fg = c.gray })
  hl("CursorLineNr", { fg = c.yellow, bold = true })
  hl("Visual",       { bg = c.selection_bg })
  hl("Search",       { fg = c.selection_fg, bg = c.selection_bg })
  hl("IncSearch",    { fg = c.selection_fg, bg = c.selection_bg })
  hl("MatchParen",   { bg = c.bright_yellow, bold = true })
  hl("VertSplit",    { fg = c.gray })
  hl("StatusLine",   { fg = c.fg, bg = c.gray })
  hl("StatusLineNC", { fg = c.gray, bg = c.bg })

  -- Popup menus
  hl("Pmenu",        { fg = c.fg, bg = c.bg })
  hl("PmenuSel",     { fg = c.bg, bg = c.bright_blue })
  hl("PmenuSbar",    { bg = c.gray })
  hl("PmenuThumb",   { bg = c.blue })

  -- Syntax
  hl("Comment",      { fg = "#7a7a70", italic = true }) -- darker gray for contrast
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
  hl("Todo",         { fg = c.bg, bg = c.bright_yellow, bold = true }) -- invert for light theme

  -- Tree-sitter
  hl("@comment",             { fg = "#7a7a70", italic = true })
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

M.setup()

return M
