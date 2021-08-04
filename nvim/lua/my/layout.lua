-- " === Color Scheme === "
vim.g.base16colorspace = 256
vim.o.termguicolors = true
vim.cmd [[ highlight Comment cterm=italic ]]

if vim.g.color_is_light then
  lualine_colorscheme = "onelight"
  vim.g.colors_name = "base16-one-light"
else
  lualine_colorscheme = "gruvbox"
  vim.g.colors_name = "gruvbox"
end

vim.cmd [[hi LineNr guibg=NONE ]]
vim.cmd [[hi Normal guibg=NONE ctermbg=NONE ]]

-- " === Lualine === "
require('lualine').setup{ 
  options = { theme = lualine_colorscheme } 
}
