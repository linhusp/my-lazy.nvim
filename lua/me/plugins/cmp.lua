-- get completion from almost everything
return {
    {
        'hrsh7th/nvim-cmp',
        name = 'nvim-cmp',
        config = function()
            local cmp = require('cmp')
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s')
                    == nil
            end
            local luasnip = require('luasnip')
            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                    ['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
                    --['<C-n>'] = cmp.mapping.select_next_item(),
                    --['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    -- super Tab completion
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),

                --completion = {
                --    autocomplete = false,
                --    completeopt = 'menu,menuone,noselect'
                --},

                -- modify source options and their priority
                sources = cmp.config.sources({
                    { name = 'luasnip' },
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'nvim_lsp', max_item_count = 20 },
                    { name = 'nvim_lua', max_item_count = 20 },
                    {
                        name = 'path',
                        option = {
                            trailing_slash = false,
                            label_trailing_slash = true,
                        },
                    },
                }, {
                    { name = 'buffer', keyword_length = 3, max_item_count = 10 },
                }),

                -- add source info to cmp menu ft. lspkind
                formatting = {
                    format = require('lspkind').cmp_format({
                        --mode = 'symbol_text',
                        mode = 'text',
                        menu = {
                            buffer = '[Buf]',
                            nvim_lsp = '[LSP]',
                            nvim_lua = '[Lua]',
                            luasnip = '[Snip]',
                            path = '[Path]',
                        },
                    }),
                },
            })

            -- insert `()` after selecting function or method ft. nvim-autopairs
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
    { 'hrsh7th/cmp-buffer',   dependencies = 'nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lua', dependencies = 'nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp', dependencies = 'nvim-cmp' },
    { 'hrsh7th/cmp-path',     dependencies = 'nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help', dependencies = 'nvim-cmp' },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
    },
    { 'onsails/lspkind.nvim' }, -- vscode-like completion icons
}
