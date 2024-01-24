return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        pin = true,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = { theme = "dropdown" },
                    buffers = { theme = "dropdown" },
                    grep_string = { theme = "dropdown" },
                },
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>f", builtin.find_files, {})
            vim.keymap.set("n", "<leader>b", builtin.buffers, {})
            vim.keymap.set("n", "<leader>gs", builtin.grep_string, {})
        end,
    },
}
