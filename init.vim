set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

set conceallevel=1

lua << EOF

vim.opt.termguicolors = true

require("lazy").setup({
    spec = {
        {import = "plugins"}
    },
    checker = {enabled = true}
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Find in files' })
vim.keymap.set('n', '<leader><leader>',
    builtin.find_files, { desc = 'Find files' })

EOF
