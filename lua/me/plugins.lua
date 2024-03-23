-- list of plugins with minimal configs, for complex ones check `./plugins/`
return {
    -- session
    {
        "dhruvasagar/vim-prosession",
        lazy = false,
        priority = 900,
        dependencies = { "tpope/vim-obsession" },
        init = function()
            vim.g.prosession_dir = vim.fn.expand("~/.cache/nvim/sessions/")
            vim.g.prosession_on_startup = 1
        end
    },

    -- colorscheme
    { "rktjmp/lush.nvim" },
    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.opt.termguicolors = true
            vim.o.background = "dark"
            require("vscode").setup({
                transparent = true,
                italic_comments = false,
                disable_nvimtree_bg = true,
            })
            require("vscode").load()
        end,
    },

    -- status line
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup({
                options = {
                    icons_enabled = false,
                    theme = 'auto',
                    component_separators = { left = '|', right = '|' },
                    section_separators = { left = '', right = '' },
                }
            })
        end
    },

    -- better python indent
    {
        'vimjas/vim-python-pep8-indent',
        ft = 'python',
        config = function()
            vim.g.python_pep8_indent_hang_closing = 0
        end
    },

    -- qol
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                fast_wrap = {
                    map = "<A-a>",
                },
                disable_in_macro = true,
                disable_in_visualblock = true,
                enable_check_bracket_line = false,
                enable_afterquote = false,
                map_cr = true,
                check_ts = true,
                ts_config = {
                    javascript = { "template_string" },
                },
            })
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup({
                indent = {
                    char = "┆",
                },
                scope = {
                    show_start = false,
                    show_end = false,
                },
                whitespace = {
                    remove_blankline_trail = false,
                },
                exclude = {
                    buftypes = { "terminal" },
                },
            })
        end,
    },

    {
        'lewis6991/gitsigns.nvim',
        tag = 'release',
        opts = {},
    },

    {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup({
                filetypes = {
                    '*',
                    '!python',
                    css = { rgb_fn = true },
                    html = { names = false }
                },
                user_default_options = {
                    mode = 'background',
                }
            })
        end,
    },

    {
        'gsuuon/note.nvim',
        opts = {
            spaces = { -- note roots, contains ./notes dir
                '~/Desktop',
            },
            keymap = {
                prefix = '<leader>n'
            }
        },
        cmd = 'Note',
        ft = 'note'
    }
}
