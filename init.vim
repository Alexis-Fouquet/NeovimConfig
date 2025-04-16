set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let g:EasyMotion_do_mapping = 0

set nocompatible
filetype off

set splitbelow

filetype plugin indent on

syntax on

" INDENT AND TABS

set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" RULERS

set colorcolumn=80
set cursorline
set ruler
set relativenumber
set number

" SEARCH

set ignorecase
set smartcase

set splitright

" PLUGINS CONFIG

" Start NERDTree when Vim starts with a directory argument.
" Code from the NERDTree README
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter *
            \ if argc() == 1
            \   && isdirectory(argv()[0])
            \   && !exists('s:std_in')
            \ | execute 'Neotree' argv()[0]
            \ | wincmd p
            \ | enew
            \ | execute 'cd '.argv()[0]
            \ | endif

" ALE
let g:ale_completion_enabled = 1
let g:ale_lint_delay = 4000

runtime! plugin/sensible.vim

set encoding=utf-8 fileencodings=

autocmd Filetype make setlocal noexpandtab
autocmd Filetype asm setlocal noexpandtab
autocmd BufRead,BufNewFile *.h set filetype=c

set list listchars=tab:>~,trail:~

let gtk_flags = ' `pkg-config --cflags gtk+-3.0`'

let g:mapleader = " "
let g:maplocalleader = " "
map <leader>f :Files<CR>
map <leader><leader> :Files<CR>
map <leader>y "+yy<CR>
map <leader>p "+p<CR>
" nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

set conceallevel=1

lua << EOF

vim.opt.termguicolors = true

require("lazy").setup({
    spec = {
        {import = "plugins"}
    },
    checker = {enabled = true}
})


EOF
