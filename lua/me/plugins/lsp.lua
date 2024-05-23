-- better lsp managing
return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({
                ui = {
                    border = 'single',
                    icons = {
                        package_installed = '*',
                        package_pending = '+',
                        package_uninstalled = '-',
                    },
                },
            })
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'pylsp', 'rust_analyzer' },
            })
        end,
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = { diagnostics = { globals = { 'vim' } } },
                },
            })
            lspconfig.pylsp.setup({})

            local opts = { noremap = true, silent = true }
            -- :h vim.diagnostic.*
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', 'd]', vim.diagnostic.goto_next, opts)
            -- :h vim.lsp.*
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        end,
    },
    -- for better rust-analyzer and rustfmt support
    {
        'mrcjkb/rustaceanvim',
        version = '^4',
        ft = 'rust'
    },
}
