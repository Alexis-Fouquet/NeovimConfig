return {
    {
        'epwalsh/obsidian.nvim',
        version = '*',
        lazy = true,
        ft = 'markdown',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        opts = {
            workspaces = {
                {
                    name = 'epita',
                    path = '~/Documents/github/backup-obs-epita',
                },
            },
            ui = {
                enable = false,
            },
        },
    },
    {
        'vimwiki/vimwiki',
        config = function ()
            vim.treesitter.language.register('markdown', 'vimwiki')
        end
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        },
        config = function ()
            require('render-markdown').setup({
                file_types = { 'markdown', 'vimwiki' },
            })
        end,
    },
}
