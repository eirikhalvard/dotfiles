local Colors = require("colors")

local function theme()
  local c = Colors.colors
  if not c then
    return "auto"
  end

  return {
    normal = {
      a = { fg = c.bg, bg = c.blue, gui = "bold" },
      b = { fg = c.fg, bg = c.gray },
      c = { fg = c.fg, bg = c.bg },
    },
    insert = {
      a = { fg = c.bg, bg = c.green, gui = "bold" },
    },
    visual = {
      a = { fg = c.bg, bg = c.magenta, gui = "bold" },
    },
    replace = {
      a = { fg = c.bg, bg = c.red, gui = "bold" },
    },
    command = {
      a = { fg = c.bg, bg = c.yellow, gui = "bold" },
    },
    inactive = {
      a = { fg = c.gray, bg = c.bg },
      b = { fg = c.gray, bg = c.bg },
      c = { fg = c.gray, bg = c.bg },
    },
  }
end

return theme