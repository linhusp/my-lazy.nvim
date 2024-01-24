-- use nvim as a language server to inject diagnostics, code actions
-- also act as a general formatter
return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.diagnostics.ruff,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.blue,
                null_ls.builtins.formatting.prettier,
            },
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
