local M = {}

M.current = nil
M.colors = nil

function M.load(name)
  local theme = require("colors." .. name)

  theme.setup()

  M.current = name
  M.colors = theme.colors
  vim.g.colors_name = name

  -- Refresh lualine if loaded
  local ok, lualine = pcall(require, "lualine")
  if ok then
    lualine.setup({
      options = {
        theme = require("lualine.theme_from_colors"),
      },
    })
  end
end

return M
