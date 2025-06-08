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
        event = 'BufRead',
        config = function ()
            vim.treesitter.language.register('markdown', 'vimwiki')
        end,
    },
    {
        'jbyuki/nabla.nvim',
        enable = false,
        lazy = true,
        dependencies = {
            'nvim-neo-tree/neo-tree.nvim',
            'williamboman/mason.nvim',
        },
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        event = 'VeryLazy',
        version = '*',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        },
        config = function ()
            require('render-markdown').setup({
                latex = {
                    enabled = false,
                },
                file_types = { 'markdown', 'vimwiki' },
                -- This lines are from the plugin documentation
                -- on = {
                --     render = function()
                --         require('nabla').enable_virt({ autogen = true })
                --     end,
                --     clear = function()
                --         require('nabla').disable_virt()
                --     end,
                -- },
            })
        end,
    },
    {
        'img-paste-devs/img-paste.vim',
        enable = false,
        event = 'VeryLazy',
    },
}
