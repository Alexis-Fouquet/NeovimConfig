return {
    {
        'vimwiki/vimwiki',
        config = function ()
            vim.treesitter.language.register('markdown', 'vimwiki')
        end
    },
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
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    { 'stevearc/oil.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    {
        'nvim-neo-tree/neo-tree.nvim',
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
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
    { 'wakatime/vim-wakatime', lazy = false },
    {
        'sphamba/smear-cursor.nvim',
        opts = {}
    },
    {
        'easymotion/vim-easymotion',
        config = function ()
            vim.g.EasyMotion_do_mapping = 0;
            vim.keymap.set('n', '<leader>d', '<Plug>(easymotion-bd-f)', {
                desc = "easymotion"
            });
        end
    },
    {
        '3rd/image.nvim',
        event = "VeryLazy",
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        },
        opts = {
            backend = "kitty",
            integrations = {
                markdown = {
                    enable = true,
                    filetypes = { "markdown", "vimwiki" },
                }
            },
            max_width = 500,
            max_height = 500,
            max_width_window_percentage = 90,
            max_height_window_percentage = 50,
            kitty_method = "normal",
        }
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

        ---@module 'render-markdown'
        ---@type render.md.UserConfig
    }
}
