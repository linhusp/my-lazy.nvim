-- some important global vars
vim.g.python3_host_prog = '/usr/bin/python'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-----------------
-- BASE CONFIG --
-----------------

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.listchars = {
    --tab = '|.',
    trail = '~',
    --eol = '¬', -- '↲'
    extends = '>',
    precedes = '<',
    nbsp = '%'
}
vim.opt.fillchars = {
    eob = ' ',
}
vim.opt.list = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
--vim.opt.guicursor = { ['i-ci-ve'] = 'block' } -- a more vanilla cursor but...
vim.opt.scrolloff = 5

-- indent
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- status
vim.opt.encoding = 'utf-8'
vim.opt.laststatus = 2 -- always show status line
vim.opt.showtabline = 1 -- show tab if at least two tab pages

-- searching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- disable builtin completion
--vim.opt.complete = ''
--vim.opt.completeopt = ''
--vim.opt.wildmenu = true -- enable enhanced mode for completion

-- message
vim.opt.shortmess:append('ac')

-- text wrap
vim.opt.wrap = true
vim.opt.linebreak = true

-- disable the annoying auto-commenting
vim.cmd([[autocmd BufEnter * set formatoptions-=cro]])

-- mouse, but why?
vim.opt.mousemodel = 'extend'


-------------------
-- BASE MAPPINGS --
-------------------

vim.g.mapleader = ' '

-- source lua buffer
vim.keymap.set('n', '<leader>l', ':luafile %<CR>')

-- just write
vim.keymap.set('n', '<leader>w', ':w<CR>')

-- delete trailing whitespaces
vim.keymap.set('n', '<leader>x', [[:%s/\s\+$//e<CR>]])

-- move text block continually
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- quickly selecting & changing buffer, but do I need this?
--vim.keymap.set('n', '<leader>b', ':ls<CR>:b<space>')

-- quickly jump to eol
vim.keymap.set('i', '<A-e>', '<C-\\><C-n>A')

-- select all text
vim.keymap.set('', '<C-a>', '<C-\\><C-n>ggVG<CR>')

-- split line, as oppose to J
vim.keymap.set('n', 'E', 'hylpr<CR>')

-- better tabs navigation
vim.keymap.set('n', '<leader>t', ':tabnew<CR>')
--vim.keymap.set('n', '<leader>h', 'gT')
--vim.keymap.set('n', '<leader>l', 'gt')

-- disable search highlighting
vim.keymap.set('n', '<BS>', ':noh<CR>')

-- system's clipboard compatible
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P')
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"+d')

-- select lastest text block
vim.keymap.set('', 'gV', '`[v`]')

-- enable `&` for other modes
vim.keymap.set({ 'v' }, '&', ':&&<CR>')

-- resize windows effectively
vim.keymap.set('', '<A-=>', ':vertical resize +5<CR>')
vim.keymap.set('', '<A-->', ':vertical resize -5<CR>')
vim.keymap.set('', '<A-+>', ':resize +5<CR>')
vim.keymap.set('', '<A-_>', ':resize -5<CR>')

-- I dont want to break my littefinger holding ctrl none stop everyday
-- now holding my thumb everyday instead
vim.keymap.set('', '<A-u>', '<C-u>')
vim.keymap.set('', '<A-d>', '<C-d>')

-- switch to the last used buffer
vim.keymap.set('n', '<leader>o', '<C-^>')

-- swapping windows vertically to horizontally
vim.keymap.set('', '<leader>S', '<C-w>t<C-w>K', { noremap = true, silent = true })
-- viceversa
vim.keymap.set('', '<leader>s', '<C-w>t<C-w>H', { noremap = true, silent = true })

-- nagigate between windows in all modes
vim.keymap.set({ 'i', 'n', 'v', 't' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 'i', 'n', 'v', 't' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 'i', 'n', 'v', 't' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 'i', 'n', 'v', 't' }, '<A-l>', '<C-\\><C-n><C-w>l')
