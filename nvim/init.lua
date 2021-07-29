require('my.plugins')
require('my.mappings')
require('my.lsp')
require('my.lualine')
require('my.misc')
require('my.options')

vim.api.nvim_exec(
[[
" Turn on syntax highlighting
syntax on 

" For plugins to load correctly
filetype plugin indent on 

let mapleader = ","
let maplocalleader = "\<Space>"

" Security
set modelines=0

" Show line numbers
set number
set relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set belloff=all

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=0 " set to 79 to autowrap after whitespace
set formatoptions=cqrn1 "t - autowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set linebreak

" Cursor motion
set scrolloff=7
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
noremap j gj
noremap gj j
noremap k gk
noremap gk k

" Allow hidden buffers
set hidden


" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

set noswapfile
set undodir=~/.config/nvim/.vimdid
set undofile

set listchars=tab:▸\ ,eol:¬

set clipboard=unnamed
]],
false)
