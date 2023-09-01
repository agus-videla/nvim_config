local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>pv", vim.cmd.Ex)

-- Move highlited lines around
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Use alt + hjkl to resize windows
map('n', '<M-j>', ':resize -2<CR>')
map('n', '<M-k>', ':resize +2<CR>')
map('n', '<M-h>', ':vertical resize -2<CR>')
map('n', '<M-l>', ':vertical resize +2<CR>')

-- Better window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Yank until last non-whitspace character
map('', 'Y', 'yg_')

-- Copy to clipboard
map('n', '<leader>d', '"+d')
map('n', '<leader>D', '"+D')
map('v', '<leader>y', '"+y')
map('n', '<leader>Y', '"+yg_')
map('n', '<leader>y', '"+y')
-- Paste from clipboard
map('n', '<leader>P', '"+P')
map('n', '<leader>p', '"+p')
map('v', '<leader>P', '"+P')
map('v', '<leader>p', '"+p')

-- stop highlighting after search
map('n', '<esc>', ':noh<cr><esc>')
-- mapping esc may bring problems. alternative: nnoremap <c-l> :noh<bar>diffup<cr><c-l>

-- Toggle spellcheck
map('', '<leader>s', ':setlocal spell! spelllang=es_es,en_us<CR>')
map('', '<leader>z', 'z=')

-- Toggle line wrap
map('n', '<leader>w', ':set wrap!<CR>')

-- Always keep cursor in the middle
map("n", "J", "mzJ`z")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "Q", "<nop>")
