return {
    {
        'tpope/vim-fugitive'
    },
    {
        'lewis6991/gitsigns.nvim',
        version = '*',
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        enable = false,
        'NeogitOrg/neogit',
        event = 'VeryLazy',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        },
        config = true,
        version = '*',
    },
}
