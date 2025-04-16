return {
    { 'lewis6991/gitsigns.nvim' },
    { 'nvim-treesitter/nvim-treesitter' },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    { 'preservim/nerdtree' },
    { 'junegunn/limelight.vim' },
    { 'vim-airline/vim-airline' },
    {
        'folke/which-key.nvim',
        opts = {
        }
    },
    { 'wakatime/vim-wakatime', lazy = false }
}
