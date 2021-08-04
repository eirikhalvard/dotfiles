vim.g.mapleader = ","
vim.g.maplocalleader = " "

require('my.compiled_colortype')
require('my.plugins')
require('my.mappings')
require('my.lsp')
require('my.layout')
require('my.misc')
require('my.options')

-- TODO
-- setup telescope
-- setup lsp, remove coc
