-- Completion file

return {
    {
        'mason-org/mason.nvim',
        -- cmd = 'Mason',
        event = 'VeryLazy',
        version = "*",
        config = function()
            require('mason').setup()
            local m_lsp = require('mason-lspconfig')
            m_lsp.setup()
            -- TODO replace this
            -- m_lsp.setup_handlers {
            --     function(name)
            --         local default = require('cmp_nvim_lsp').default_capabilities()
            --         if name == 'cssls' then
            --             require('lspconfig').cssls.setup({
            --                 capabilities = default,
            --                 settings = {
            --                     css = {
            --                         validate = true
            --                     }
            --                 }
            --             })
            --         elseif name == 'lua_ls' then
            --             require('lspconfig').lua_ls.setup({
            --                 capabilities = default,
            --                 settings = {
            --                     Lua = {
            --                         diagnostics = {
            --                             globals = { 'vim' }
            --                         }
            --                     }
            --                 }
            --             })
            --         else
            --             require('lspconfig')[name].setup({
            --                 capabilities = default
            --             })
            --         end
            --     end
            -- }
        end,
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason-lspconfig.nvim'
        }
    },
    {
        'neovim/nvim-lspconfig',
        -- version = '1.7.*',
        version = '*',
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.clangd.setup({})
        end
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            {
                'L3MON4D3/LuaSnip',
                version = 'v2.*',
                dependencies = {
                    { 'saadparwaiz1/cmp_luasnip' }
                }
            }
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            -- Debug only
            -- vim.notify('Configuring nvim cmp', 'warning')
            cmp.setup {
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<S-Tab>'] = cmp.mapping(function (fallback)
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
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
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                            end
                            cmp.confirm()
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, {'i','s','c',}),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'luasnip' }
                }),
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
