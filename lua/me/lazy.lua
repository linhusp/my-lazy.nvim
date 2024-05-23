local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('me.plugins', {
    install = {
        -- missing = false,
        colorscheme = { 'vscode' },
    },
    -- remove the bloated icons spam
    ui = {
        border = 'single',
        icons = {
            cmd = '[cmd]',
            config = '[conf]',
            event = '[event]',
            ft = '[ft]',
            init = '[init]',
            import = '[imp]',
            keys = '[key]',
            lazy = '[lazy]',
            loaded = '*',
            not_loaded = '-',
            plugin = '[plug]',
            runtime = '[run]',
            require = '[req]',
            source = '[src]',
            start = '[start]',
            task = '[task]',
            list = {
                '+',
                '-',
            },
        },
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
})
