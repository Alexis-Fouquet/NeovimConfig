return {
    { 'nvim-tree/nvim-web-devicons' },
    {
        'rcarriga/nvim-notify',
        lazy = false,
        -- Version 3.15 not working with nvim 0.9.5
        -- version = 'v3.14.*',
        version = '*',
        config = function()
            vim.notify = require('notify')
        end
    },
    {
        -- Should be disabled on slow computers
        'sphamba/smear-cursor.nvim',
        event = 'VeryLazy',
        opts = {}
    },
    {
        'folke/which-key.nvim',
        opts = {}
    },
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        '3rd/image.nvim',
        event = 'VeryLazy',
        -- Some bugs were in the last commit
        -- Check again later
        commit = '6ffafab',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        },

        opts = {
            backend = 'kitty',
            kitty_method = 'normal',
            processor = 'magick_rock',

            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = false,
                    download_remote_images = false,
                    only_render_image_at_cursor = false,
                    filetypes = { 'markdown', 'vimwiki' },
                }
            },
            max_width = 500,
            max_height = 500,
            max_width_window_percentage = 90,
            max_height_window_percentage = 50,
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        event = 'BufRead',
        -- version = "*",
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'auto',
                    icons_enabled = true,
                },
            }
        end,
    },
}
