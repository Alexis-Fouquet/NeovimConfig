return {
    {
        'rcarriga/nvim-notify',
        lazy = false,
        -- Version 3.15 not working with nvim 0.9.5
        version = 'v3.14.*',
        config = function()
            vim.notify = require("notify")
        end
    },
}
