-- find, filter, preview, pick
return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup({
                defaults = {
                    -- sorting_strategy = 'ascending',
                    path_display = { 'truncate' },
                    layout_strategy = 'vertical',
                    layout_config = {
                        vertical = {
                            preview_cutoff = 1,
                            width = function(_, max_col, _)
                                return math.min(max_col, 80)
                            end,
                        },
                    },
                },
            })
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>f', builtin.find_files, {})
            vim.keymap.set('n', '<leader>b', builtin.buffers, {})
            vim.keymap.set('n', '<leader>gs', builtin.grep_string, {})
        end,
    },
}
