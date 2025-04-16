set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

lua << EOF

require("lazy").setup({
    spec = {
        {import = "plugins"}
    },
    checker = {enabled = true}
})

EOF
