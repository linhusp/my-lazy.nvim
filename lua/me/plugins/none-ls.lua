-- use nvim as a language server to inject diagnostics, code actions
-- also act as a general formatter
return {
    "nvimtools/none-ls.nvim",
    -- prevent the stupidity of introducing breaking changes,
    -- at https://github.com/nvimtools/none-ls.nvim/discussions/81
    -- expect migrate from none-ls in the near future
    commit = "8f4601a099902b933a283593809a9b8e9277468c",
    pin = true,
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.diagnostics.ruff,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.blue,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.beautysh,
            },
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
