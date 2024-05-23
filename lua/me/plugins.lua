-- list of plugins with minimal configs, for complex ones check `./plugins/`
return {
    -- session
    {
        'dhruvasagar/vim-prosession',
        lazy = false,
        priority = 900,
        dependencies = { 'tpope/vim-obsession' },
        init = function()
            vim.g.prosession_dir = vim.fn.expand('~/.cache/nvim/sessions/')
            vim.g.prosession_on_startup = 0
        end
    },

    -- status line
    -- {
    --     'nvim-lualine/lualine.nvim',
    --     config = function()
    --         require('lualine').setup({
    --             options = {
    --                 icons_enabled = false,
    --                 theme = 'auto',
    --                 component_separators = { left = '|', right = '|' },
    --                 section_separators = { left = '', right = '' },
    --             }
    --         })
    --     end
    -- },

    -- better python indent
    {
        'vimjas/vim-python-pep8-indent',
        ft = 'python',
        config = function()
            vim.g.python_pep8_indent_hang_closing = 0
        end
    },

    -- mini project
    {
        'echasnovski/mini.indentscope',
        version = '*',
        config = function()
            local custom_animation = require('mini.indentscope').gen_animation.none()
            require('mini.indentscope').setup({
                draw = {
                    delay = 0,
                    animation = custom_animation,
                },
                symbol = '┆'
            })
        end
    },
    -- { 'echasnovski/mini.statusline', version = '*',   opts = {} },
    { 'echasnovski/mini.pairs',      version = '*',   opts = {} },

    -- qol
    -- {
    --     "windwp/nvim-autopairs",
    --     config = function()
    --         require("nvim-autopairs").setup({
    --             fast_wrap = {
    --                 map = "<A-a>",
    --             },
    --             disable_in_macro = true,
    --             disable_in_visualblock = true,
    --             enable_check_bracket_line = false,
    --             enable_afterquote = false,
    --             map_cr = true,
    --             check_ts = true,
    --             ts_config = {
    --                 javascript = { "template_string" },
    --             },
    --         })
    --     end,
    -- },

    { 'lewis6991/gitsigns.nvim',     tag = 'release', opts = {}, },

    {
        'NvChad/nvim-colorizer.lua',
        opts = {
            filetypes = {
                '*',
                '!python',
                css = { rgb_fn = true },
                html = { names = false }
            },
            user_default_options = {
                mode = 'background',
            }
        },
    },

    -- move code to the middle of the screen
    {
        'shortcuts/no-neck-pain.nvim',
        version = '*',
        opts = {
            width = 100,
            buffer = {
                blend = -0.1,
            }
        },
    },

    -- additional UI progress message
    {
        'j-hui/fidget.nvim',
        opts = {},
    },
}
