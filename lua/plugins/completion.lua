vim.lsp.enable("clangd")
vim.diagnostic.config({ virtual_text = true })

return {
    {
        'mason-org/mason-lspconfig.nvim',
        version = "*",
        opts = {},
        dependencies = {
            'mason-org/mason.nvim',
            {
                'neovim/nvim-lspconfig',
                version = '*',
            },
        },
    },
    {
        'mason-org/mason.nvim',
        event = 'VeryLazy',
        version = "*",
        opts = {},
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-calc' },
            { 'onsails/lspkind.nvim' },
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup {
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<S-Tab>'] = cmp.mapping(function (fallback)
                        if cmp.visible() then
                            cmp.select_next_item({
                                behavior = cmp.SelectBehavior.Select
                            })
                        else
                            fallback()
                        end
                    end, {'i', 's', 'c'}),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        -- From the wiki
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if not entry then
                                cmp.select_next_item({
                                    behavior = cmp.SelectBehavior.Select
                                })
                            end
                            cmp.confirm()
                        else
                            fallback()
                        end
                    end, {'i','s','c',}),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    -- From the wiki
                    format = function(entry, vim_item)
                        local kind = require("lspkind")
                            .cmp_format({
                                mode = "symbol_text",
                                maxwidth = 60,
                            })(entry, vim_item)
                        local strings = vim.split(
                            kind.kind,
                            "%s",
                            { trimempty = true }
                        )
                        kind.kind = " " .. (strings[1] or "") .. " "
                        kind.menu = "    (" .. (strings[2] or "") .. ")"

                        return kind
                    end,
                },
            }

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })
        end
    }
}
