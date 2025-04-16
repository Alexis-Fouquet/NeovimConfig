return {
    {
        'williamboman/mason.nvim',
        -- cmd = 'Mason',
        lazy = false,
        config = function()
            require('mason').setup()
            local m_lsp = require('mason-lspconfig')
            m_lsp.setup()
            m_lsp.setup_handlers {
                function(name)
                    require('lspconfig')[name].setup({})
                end
            }
        end,
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason-lspconfig.nvim'
        }
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({})
        end
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                dependencies = {
                    { 'saadparwaiz1/cmp_luasnip' }
                }
            }
        },
        config = function()
            local cmp = require('cmp')
            vim.notify("Configuring nvim cmp", "warning")
            cmp.setup {
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if not entry then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                            end
                            cmp.confirm()
                        else
                            fallback()
                        end
                    end, {"i","s","c",}),
                }),
                sources = {
                    cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = "buffer" },
                    })
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                }
            }
        end
    }
}
