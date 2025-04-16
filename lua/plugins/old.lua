return {
    { 'stevearc/oil.nvim' },
    { 'junegunn/limelight.vim' },
    { 'wakatime/vim-wakatime', lazy = false },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true
    },
    {
        'nvim-treesitter/nvim-treesitter',
        version = '*',
        opts = {
            highlight = { enable = true }
        },
        config = function (_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
    },
    {
        'easymotion/vim-easymotion',
        config = function ()
            vim.g.EasyMotion_do_mapping = 0;
            vim.keymap.set('n', '<leader>d', '<Plug>(easymotion-bd-f)', {
                desc = 'easymotion'
            });
        end
    },
}
