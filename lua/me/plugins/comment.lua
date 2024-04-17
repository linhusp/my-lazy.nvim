-- effective way to comment codes
return {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
            -- ignore empty lines
            ignore = '^$',
            -- add space after comment symbol
            padding = function()
                local not_allowed = {
                    'confini',
                    'ini',
                }
                for _, ft in ipairs(not_allowed) do
                    if vim.bo.filetype == ft then
                        return false
                    end
                end
                return true
            end,
            -- weather the cursor should stay at its position
            toggler = {
                -- line-comment toggle keymap
                line = 'gcc',
                -- block-comment toggle keymap
                block = 'gbc',
            },
            -- lhs of operator-pending mappings in normal and visual mode
            opleader = {
                -- line-comment keymap
                line = 'gc',
                -- block-comment keymap
                block = 'gb',
            },
            -- lhs of extra mappings
            extra = {
                -- add comment at the end of line
                eol = 'gcA',
            },
            -- enable keybindings
            -- NOTE: If given `false` then the plugin won't create any mappings
            mappings = {
                -- operator-pending mapping; `gcc` `gbc`
                -- `gc[count]{motion}` `gb[count]{motion}`
                basic = true,
                -- extra mapping; `gco`, `gcO`, `gcA`
                extra = true,
            },
        })
        -- custom commentstring :h Comment.ft
        local ft = require('Comment.ft')
        ft({ 'confini', 'ini' }, '#%s')
    end,
}
