return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    { 'preservim/nerdtree' },
    { 'junegunn/limelight.vim' },
    { 'vim-airline/vim-airline' },
    { 'which-key.nvim' },
    { 'wakatime/vim-wakatime', lazy = false }
}
