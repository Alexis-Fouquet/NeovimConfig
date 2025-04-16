return {
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim'
        },
        config = function ()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>f', builtin.find_files, {
                desc = 'Find files'
            })
            vim.keymap.set('n', '<leader>g', builtin.live_grep, {
                desc = 'Find in files'
            })
            vim.keymap.set('n', '<leader><leader>', builtin.find_files, {
                desc = 'Find files'
            })
        end
    }
}
