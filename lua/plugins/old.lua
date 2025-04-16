return {
    { 'vimwiki/vimwiki' },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    { 'tpope/vim-fugitive' },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        'NeogitOrg/neogit',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        },
        config = true,
        -- While I do not have neovim 0.10, I must git this
        version = 'v0.0.1'
    },
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
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("lualine").setup {
                options = {
                    theme = 'auto',
                    icons_enabled = true,
                },
            }
        end,
    },
    {
        'folke/which-key.nvim',
        opts = {
        }
    },
    { 'wakatime/vim-wakatime', lazy = false }
}
