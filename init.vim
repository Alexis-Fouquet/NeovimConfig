set nocompatible

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Avoid <LEADER><LEADER> being remapped
let g:EasyMotion_do_mapping = 0

filetype off
filetype plugin indent on
syntax on

set splitbelow
set splitright

" INDENT AND TABS

set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" RULERS

set colorcolumn=80
set signcolumn=yes
set cursorline
set ruler
set relativenumber
set number

" SEARCH

set ignorecase
set smartcase

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

set encoding=utf-8 fileencodings=

autocmd Filetype make setlocal noexpandtab
autocmd Filetype asm setlocal noexpandtab
autocmd BufRead,BufNewFile *.h set filetype=c

" If working with gtk
" let gtk_flags = ' `pkg-config --cflags gtk+-3.0`'

let g:mapleader = " "
let g:maplocalleader = " "
map <leader>f :Files<CR>
map <leader><leader> :Files<CR>
map <leader>y "+yy<CR>
map <leader>p "+p<CR>
autocmd FileType markdown nmap <buffer><silent> <leader>P :call mdip#MarkdownClipboardImage()<CR>

lua << EOF

-- START: code from lazy.nvim documentation
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- END: code from lazy.nvim documentation

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

vim.opt.termguicolors = true
vim.opt.conceallevel = 2
vim.opt.list = true
vim.opt.listchars = {
    tab = '>~',
    trail = '~'
}

require("lazy").setup({
    spec = {
        {import = "plugins"}
    },
    checker = {enabled = true}
})

EOF
