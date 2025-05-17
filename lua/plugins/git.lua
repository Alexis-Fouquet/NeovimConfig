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
        'NeogitOrg/neogit',
        event = 'VeryLazy',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        },
        config = true,
        -- While I do not have neovim 0.10, I must git this
        -- version = 'v0.0.1'
        version = '*',
    },
}
