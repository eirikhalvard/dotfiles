local M = {}

M.setup = function()
  vim.cmd("highlight clear")
  vim.o.background = "light"
  vim.o.termguicolors = true

  local colors = {
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

  local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Core UI
  hl("Normal",       { fg = colors.fg, bg = colors.bg })
  hl("Cursor",       { fg = colors.cursor_text, bg = colors.cursor })
  hl("CursorLine",   { bg = "#f0f0e0" })  -- slightly lighter than bg
  hl("LineNr",       { fg = colors.gray })
  hl("CursorLineNr", { fg = colors.yellow, bold = true })
  hl("Visual",       { bg = colors.selection_bg })
  hl("Search",       { fg = colors.selection_fg, bg = colors.selection_bg })
  hl("IncSearch",    { fg = colors.selection_fg, bg = colors.selection_bg })
  hl("MatchParen",   { bg = colors.bright_yellow, bold = true })
  hl("VertSplit",    { fg = colors.gray })
  hl("StatusLine",   { fg = colors.fg, bg = colors.gray })
  hl("StatusLineNC", { fg = colors.gray, bg = colors.bg })

  -- Popup menus
  hl("Pmenu",        { fg = colors.fg, bg = colors.bg })
  hl("PmenuSel",     { fg = colors.bg, bg = colors.bright_blue })
  hl("PmenuSbar",    { bg = colors.gray })
  hl("PmenuThumb",   { bg = colors.blue })

  -- Syntax
  hl("Comment",      { fg = "#7a7a70", italic = true }) -- darker gray for contrast
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
  hl("Todo",         { fg = colors.bg, bg = colors.bright_yellow, bold = true }) -- invert for light theme

  -- Tree-sitter
  hl("@comment",             { fg = "#7a7a70", italic = true })
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

M.setup()

return M
