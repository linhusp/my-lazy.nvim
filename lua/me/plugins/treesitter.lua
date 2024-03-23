-- better syntax highlighting
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        version = "v0.9.2",
        pin = true,
        config = function()
            require("nvim-treesitter.configs").setup({
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    disable = function(lang, buf)
                        local max_filesize = 500 * 1024
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                    disable = { "python" },
                },
                rainbow = {
                    enable = true,
                    -- which query to use for finding delimiters
                    query = {
                        "rainbow-parens",
                    },
                    -- highlight the entire buffer all at once
                    strategy = require("ts-rainbow").strategy.global,
                    hlgroups = {
                        "TSRainbowWhite",
                        "TSRainbowViolet",
                        "TSRainbowCyan",
                    },
                },
                endwise = {
                    enable = true,
                },
            })
            require("nvim-ts-autotag").setup({ enable = true })
        end,
    },
    { "HiPhish/nvim-ts-rainbow2", dependencies = "nvim-treesitter" },
    { "windwp/nvim-ts-autotag",   dependencies = "nvim-treesitter" },
}
